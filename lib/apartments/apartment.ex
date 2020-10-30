defmodule Apartments.Apartment do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:id, :name, :description, :vacancies, :location, :reservations]}

  schema "apartments" do
    field :name, :string
    field :description, :string
    field :vacancies, :integer
    field :location, :string
    has_many :reservations, Apartments.Reservation
    timestamps
  end
end
