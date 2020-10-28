defmodule ApartmentsWeb.ReservationsController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias Apartments.Apartment
  alias Apartments.Reservation

  def create(conn, %{"apartment_id" => apartment_id, "date" => date_string}) do
    apartment =
      Apartment
      |> Repo.get!(apartment_id)
      |> Repo.preload(:reservations)

    date = Date.from_iso8601!(date_string)

    cond do
      Enum.any?(apartment.reservations, &(&1.date == date)) ->
        conn
        |> put_status(:conflict)
        |> json("Date is already reserved for this apartment")

      true ->
        Repo.insert!(%Reservation{
          date: date,
          reserved_on: DateTime.truncate(DateTime.utc_now(), :second),
          apartment_id: apartment.id
        })
    end

    conn
    |> put_status(:created)
    |> json("Successfully reserved #{date_string} for apartment #{apartment.id}")
  end

  def show(conn, %{"id" => id}) do
    reservation =
      Repo.get!(Reservation, id)
      |> Repo.preload(:weather)

    json(conn, reservation)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Reservation))
  end
end
