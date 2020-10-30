defmodule Apartments.Rabbit.Consumer do
  use Rabbit.Consumer
  alias Apartments.Repo
  alias Apartments.Apartment
  alias Apartments.Reservation
  alias Apartments.Weather

  @owm_api_key "ae2eacea49a8dde07d7b51840b131d3e"

  def start_link(opts \\ []) do
    Rabbit.Consumer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  # Callbacks

  @impl Rabbit.Consumer
  def init(_type, opts) do
    # Perform any runtime configuration
    {:ok, opts}
  end

  @impl Rabbit.Consumer
  def handle_setup(channel, queue) do
    # Optional callback to perform exchange or queue setup
    AMQP.Queue.declare(channel, queue)

    :ok
  end

  @impl Rabbit.Consumer
  def handle_message(message) do
    # Handle consumed messages
    create_reservation(message.decoded_payload)
    {:ack, message}
  end

  @impl Rabbit.Consumer
  def handle_error(message) do
    # Handle errors that occur within handle_message/1

    {:nack, message}
  end

  defp create_reservation(%{"apartment_id" => apartment_id, "date" => date_string}) do
    %{location: location, reservations: reservations} =
      Apartment
      |> Repo.get!(apartment_id)
      |> Repo.preload(:reservations)

    date = Date.from_iso8601!(date_string)

    cond do
      Enum.any?(reservations, &(&1.date == date)) ->
        {:error, "Date is already reserved for this apartment"}

      true ->
        %{id: reservation_id} =
          Repo.insert!(%Reservation{
            date: date,
            reserved_on: DateTime.truncate(DateTime.utc_now(), :second),
            apartment_id: apartment_id
          })

        weather_data = get_weather_data(location, date)

        Repo.insert!(%Weather{
          reservation_id: reservation_id,
          temperature: weather_data.temperature,
          umidity: weather_data.humidity,
          is_good_weather: weather_data.temperature > 25 and weather_data.humidity < 80
        })

        {:ok, "Successfully reserved #{date_string} for apartment #{apartment_id}"}
    end
  end

  defp get_weather_data(location, _date) do
    url =
      "http://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(location)}&units=metric&appid=#{
        @owm_api_key
      }"

    %HTTPoison.Response{status_code: 200, body: body} = HTTPoison.get!(url)
    %{"main" => weather} = Poison.decode!(body)
    %{temperature: floor(weather["temp"]), humidity: floor(weather["humidity"])}
  end
end
