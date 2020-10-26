defmodule ApartmentsWeb.Weather do
  use Ecto.Schema

  schema "weathers" do
    field :temperature, :integer
    field :umidity, :integer
    field :is_good_weather, :boolean
    belongs_to :reservation, ApartmentsWeb.Reservation
  end
end
