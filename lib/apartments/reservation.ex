defmodule Apartments.Reservation do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:id, :date, :reserved_on, :weather]}

  schema "reservations" do
    field :date, :date
    field :reserved_on, :utc_datetime
    has_one :weather, Apartments.Weather
    belongs_to :apartment, Apartments.Apartment
  end
end
