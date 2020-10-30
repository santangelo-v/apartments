defmodule Apartments.Weather do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:id, :temperature, :umidity, :is_good_weather]}

  schema "weathers" do
    field :temperature, :integer
    field :umidity, :integer
    field :is_good_weather, :boolean
    belongs_to :reservation, Apartments.Reservation
  end
end
