defmodule Apartments.Repo.Migrations.AddLocationColumnApartment do
  use Ecto.Migration

  def change do
    alter table(:apartments) do
      add :location, :text
    end
  end
end
