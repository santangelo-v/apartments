defmodule ApartmentsWeb.ReservationsController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias Apartments.Apartment
  alias Apartments.Reservation

  def create(conn, data) do
    Rabbit.Producer.publish(Apartments.Rabbit.Producer, "", "reservations_queue", data,
      content_type: "application/json"
    )

    json(conn, "Successfully added reservation to queue")
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
