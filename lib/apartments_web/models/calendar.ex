defmodule ApartmentsWeb.Calendar do
  use Ecto.Schema

  schema "calendars" do
    field :name, :string
    has_many :reservations, ApartmentsWeb.Reservation
    belongs_to :apartment, ApartmentsWeb.Apartment
  end
end
