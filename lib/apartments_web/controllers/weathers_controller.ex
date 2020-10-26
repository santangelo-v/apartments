defmodule ApartmentsWeb.WeathersController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias ApartmentsWeb.Weather

  def show(conn, %{"id" => id}) do
    weather = Repo.get(Weather, id)
    json(conn, weather)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Weather))
  end
end
