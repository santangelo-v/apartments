defmodule ApartmentsWeb.Reservation do
  use Ecto.Schema

  schema "reservations" do
    field :date, :date
    field :reserved_on, :utc_datetime
    field :vacancies, :integer
    has_one :weather, ApartmentsWeb.Weather
    belongs_to :calendar, ApartmentsWeb.Calendar
  end
end
