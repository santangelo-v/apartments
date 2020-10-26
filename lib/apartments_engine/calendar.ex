defmodule ApartmentsEngine.Calendar do
  alias __MODULE__

  @type t :: %Calendar{reservation_list: list()}

  @enforce_keys [:reservation_list]
  defstruct [:reservation_list]

  @spec new(list()) :: {:error, <<_::312>>} | {:ok, ApartmentsEngine.Calendar.t()}
  def new(reservation_list) when not is_list(reservation_list) do
    {:error, "You must provide a LIST of reservations"}
  end

  def new(reservation_list) do
    {:ok, %Calendar{reservation_list: reservation_list}}
  end
end
