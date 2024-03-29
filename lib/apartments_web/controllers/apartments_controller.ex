defmodule ApartmentsWeb.ApartmentsController do
  use ApartmentsWeb, :controller
  import Ecto.Query
  alias Apartments.Repo
  alias Apartments.Apartment

  def delete(conn, %{"id" => id}) do
    Repo.get!(Apartment, id)
    |> Repo.delete!()

    json(conn, "Successfully deleted apartment #{id}")
  end

  def update(conn, %{
        "id" => id,
        "name" => name,
        "description" => description,
        "location" => location
      }) do
    Repo.get!(Apartment, id)
    |> Ecto.Changeset.change(name: name, description: description, location: location)
    |> Repo.update!()

    json(conn, "Successfully updated apartment #{id}")
  end

  def create(conn, %{
        "name" => name,
        "description" => description,
        "vacancies" => vacancies,
        "location" => location
      }) do
    query =
      from a in Apartment,
        where: a.name == ^name

    cond do
      Repo.exists?(query) ->
        conn
        |> put_status(:conflict)
        |> json("An apartment with the same name already exist.")

      true ->
        conn
        |> put_status(:created)
        |> json(
          Repo.insert!(%Apartment{
            name: name,
            description: description,
            vacancies: vacancies,
            location: location
          })
        )
    end
  end

  def show(conn, %{"id" => id}) do
    apartment =
      Repo.get(Apartment, id)
      |> Repo.preload(reservations: [:weather])

    json(conn, apartment)
  end

  def index(conn, _params) do
    json(conn, Repo.all(Apartment) |> Repo.preload(reservations: [:weather]))
  end
end
