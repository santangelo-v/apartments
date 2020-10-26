defmodule ApartmentsEngine.Weather do
  alias __MODULE__

  @type t :: %Weather{temperature: number(), umidity: number(), is_good_weather: boolean()}

  @enforce_keys [:temperature, :umidity, :is_good_weather]
  defstruct [:temperature, :umidity, :is_good_weather]

  @spec new(any, any) :: {:error, <<_::280>>} | {:ok, ApartmentsEngine.Weather.t()}
  def new(_, umidity) when umidity < 0 or umidity > 100 do
    {:error, "Umidity must be between 0% and 100%"}
  end

  def new(temperature, umidity) do
    {:ok,
     %Weather{
       temperature: temperature,
       umidity: umidity,
       is_good_weather: temperature > 23
     }}
  end
end
