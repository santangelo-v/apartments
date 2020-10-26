defmodule Apartments.Repo.Migrations.AlterApartments do
  use Ecto.Migration

  def change do
    alter table(:apartments) do
      add :vacancies, :integer
      add :calendar_id, references(:calendars)
    end
  end
end
