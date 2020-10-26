defmodule ApartmentsWeb.ReservationsController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias ApartmentsWeb.Reservation

  def show(conn, %{"id" => id}) do
    reservation = Repo.get(Reservation, id)
    json(conn, reservation)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Reservation))
  end
end
