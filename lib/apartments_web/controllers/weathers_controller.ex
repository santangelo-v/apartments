defmodule ApartmentsWeb.WeathersController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias Apartments.Reservation
  alias Apartments.Weather

  def create(conn, %{"reservation_id" => reservation_id}) do
    reservation = Repo.get!(Reservation, reservation_id)

    {temp, umidity} = some_service()

    Repo.insert!(%Weather{
      temperature: temp,
      umidity: umidity,
      is_good_weather: temp > 30 and umidity < 70,
      reservation_id: reservation.id
    })

    conn
    |> put_status(:created)
    |> json("Successfully added weather information to reservation #{reservation.id}")
  end

  def show(conn, %{"id" => id}) do
    weather = Repo.get!(Weather, id)
    json(conn, weather)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Weather))
  end

  defp some_service() do
    {31, 69}
  end
end
