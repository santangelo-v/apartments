defmodule Apartments.Rabbit.Producer do
  use Rabbit.Producer

  def start_link(opts \\ []) do
    Rabbit.Producer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  # Callbacks

  @impl Rabbit.Producer
  def init(:producer_pool, opts) do
    # Perform any runtime configuration for the pool
    {:ok, opts}
  end

  def init(:producer, opts) do
    # Perform any runtime configuration per producer
    {:ok, opts}
  end
end
