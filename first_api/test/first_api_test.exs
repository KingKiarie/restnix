defmodule FirstApiTest do
  use ExUnit.Case
  doctest FirstApi

  test "greets the world" do
    assert FirstApi.hello() == :world
  end
end
