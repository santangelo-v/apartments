defmodule ApartmentsTest do
  use ExUnit.Case
  doctest Apartments

  test "greets the world" do
    assert Apartments.hello() == :world
  end
end
