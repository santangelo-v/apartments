defmodule ApartmentsWeb.Apartment do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:id, :name, :description, :vacancies]}

  schema "apartments" do
    field :name, :string
    field :description, :string
    field :vacancies, :integer
    has_many :reservations, ApartmentsWeb.Reservation
    timestamps
  end
end
