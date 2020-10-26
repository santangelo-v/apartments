defmodule Apartments.Repo.Migrations.CreateCalendar do
  use Ecto.Migration

  def change do
    create table(:calendars) do
      add :name, :string
      add :apartment_id, references(:apartments)
    end
  end
end
