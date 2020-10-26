defmodule ApartmentsWeb.Reservation do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:date, :reserved_on, :vacancies, :weather]}

  schema "reservations" do
    field :date, :date
    field :reserved_on, :utc_datetime
    field :vacancies, :integer
    has_one :weather, ApartmentsWeb.Weather
    belongs_to :calendar, ApartmentsWeb.Calendar
  end
end
