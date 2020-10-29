defmodule Apartments.Rabbit.Consumer do
  use Rabbit.Consumer
  alias Apartments.Repo
  alias Apartments.Apartment
  alias Apartments.Reservation

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
    apartment =
      Apartment
      |> Repo.get!(apartment_id)
      |> Repo.preload(:reservations)

    date = Date.from_iso8601!(date_string)

    cond do
      Enum.any?(apartment.reservations, &(&1.date == date)) ->
        {:error, "Date is already reserved for this apartment"}

      true ->
        Repo.insert!(%Reservation{
          date: date,
          reserved_on: DateTime.truncate(DateTime.utc_now(), :second),
          apartment_id: apartment.id
        })
    end

    {:ok, "Successfully reserved #{date_string} for apartment #{apartment.id}"}
  end
end
