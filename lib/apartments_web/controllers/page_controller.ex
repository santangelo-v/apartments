defmodule ApartmentsWeb.PageController do
  use ApartmentsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create_reservation(conn, _params) do
    render(conn, "create_reservation.html")
  end

  def create_apartment(conn, _params) do
    render(conn, "create_apartment.html")
  end

  def view_apartment(conn, %{"id" => id}) do
    render(conn, "view_apartment.html", id: id)
  end

  def show_apartments(conn, _params) do
    render(conn, "apartments.html")
  end
end
