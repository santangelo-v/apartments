defmodule Apartments.Repo.Migrations.AlterApartmentsColumn do
  use Ecto.Migration

  def change do
    alter table(:apartments) do
      modify :vacancies, :integer
    end
  end
end
