defmodule ApartmentsWeb.ApartmentsController do
  use ApartmentsWeb, :controller
  alias Apartments.Repo
  alias ApartmentsWeb.Apartment

  def create(conn, %{"name" => name, "description" => description, "vacancies" => vacancies}) do
    vacancies = %Apartment{name: name, description: description, vacancies: vacancies}
    json(conn, Repo.insert!(vacancies))
  end

  def show(conn, %{"id" => id}) do
    apartment = Repo.get(Apartment, id)
    json(conn, apartment)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Apartment))
  end
end
