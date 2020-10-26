defmodule ApartmentsWeb.Apartment do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:name, :description, :vacancies, :calendar]}

  schema "apartments" do
    field :name, :string
    field :description, :string
    field :vacancies, :integer
    has_one :calendar, ApartmentsWeb.Calendar

    timestamps
  end
end
