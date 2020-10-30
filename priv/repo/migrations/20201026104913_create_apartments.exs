defmodule Apartments.Repo.Migrations.CreateApartments do
  use Ecto.Migration

  def change do
    create table(:apartments) do
      add :name, :string
      add :description, :string
      add :vacancies, :integer
      add :location, :text
      timestamps
    end
  end
end
