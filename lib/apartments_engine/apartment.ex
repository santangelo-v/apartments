defmodule ApartmentsEngine.Apartment do
  alias __MODULE__

  @typedoc """
  Defines an apartment with its name, description, vacancies, calendar and weather
  """

  @type t :: %Apartment{
          name: String.t(),
          description: String.t(),
          vacancies: pos_integer(),
          calendar: ApartmentsEnginge.Calendar.t()
        }

  @enforce_keys [:name, :description, :vacancies]
  defstruct [
    :name,
    :description,
    :vacancies,
    :calendar
  ]

  @spec new(
          String.t(),
          String.t(),
          pos_integer(),
          ApartmentsEnginge.Calendar.t()
        ) ::
          {:error, <<_::176>>} | {:ok, ApartmentsEngine.Apartment.t()}
  def new(_, _, vacancies, _, _) when vacancies < 1 do
    {:error, "Vacancies must be >= 1"}
  end

  def new(name, description, vacancies, calendar) do
    {:ok,
     %Apartment{
       name: name,
       description: description,
       vacancies: vacancies,
       calendar: calendar
     }}
  end
end
