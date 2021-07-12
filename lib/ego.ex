defmodule Ego do
  @moduledoc """
  Documentation for `Ego`.
  """



  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    Mark.convert()
    Plug.Cowboy.http(MyPlug, [])
  end
end
