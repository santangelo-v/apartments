defmodule Apartments.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:weathers) do
      add :temperature, :integer
      add :umidity, :integer
      add :is_good_weather, :boolean
      add :reservation_id, references(:reservations, on_delete: :delete_all)
    end
  end
end
