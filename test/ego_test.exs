defmodule EgoTest do
  use ExUnit.Case
  doctest Ego

  test "parse domain" do
    assert EgoConfig.port() == 3000
  end

  test "init" do
    Mark.init()
  end

  test "start server" do
    Ego.start_server()
  end
end
