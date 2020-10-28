defmodule Apartments.Apartment do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:id, :name, :description, :vacancies, :reservations]}

  schema "apartments" do
    field :name, :string
    field :description, :string
    field :vacancies, :integer
    has_many :reservations, Apartments.Reservation
    timestamps
  end
end
