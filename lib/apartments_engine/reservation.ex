defmodule ApartmentsEngine.Reservation do
  alias __MODULE__

  @type t :: %Reservation{date: Date.t(), reserved_on: DateTime.t()}

  @enforce_keys [:date, :reserved_on]
  defstruct [:date, :reserved_on]

  @spec new(any, any) :: {:error, <<_::376>>} | {:ok, ApartmentsEngine.Reservation.t()}
  def new(date, reserved_on) when not is_binary(date) or not is_binary(reserved_on) do
    {:error, "Date and reservation date must be date strings."}
  end

  def new(date, reserved_on) do
    {:ok, %Reservation{date: date, reserved_on: reserved_on}}
  end
end
