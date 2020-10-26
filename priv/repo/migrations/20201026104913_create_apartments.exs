defmodule Apartments.Repo.Migrations.CreateApartments do
  use Ecto.Migration

  def change do
    create table(:apartments) do
      add :name, :string
      add :description, :string
      timestamps
    end
  end
end
