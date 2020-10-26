defmodule Apartments.Repo.Migrations.CreateReservation do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :date, :date
      add :reserved_on, :utc_datetime
      add :vacancies, :integer
      add :calendar_id, references(:calendars)
    end
  end
end
