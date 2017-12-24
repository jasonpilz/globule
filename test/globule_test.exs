defmodule Globule do
  use ExUnit.Case
  doctest Globule

  test "greets the world" do
    assert Globule.hello() == :world
  end
end
