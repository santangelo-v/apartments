defmodule ApartmentsWeb.CalendarsController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias ApartmentsWeb.Calendar

  def show(conn, %{"id" => id}) do
    calendar = Repo.get(Calendar, id)
    json(conn, calendar)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Calendar))
  end
end
