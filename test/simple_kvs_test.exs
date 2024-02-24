defmodule SimpleKVSTest do
  use ExUnit.Case
  doctest SimpleKVS

  test "greets the world" do
    assert SimpleKVS.hello() == :world
  end
end
