defmodule EgoConfig do
  @conf File.read!("#{File.cwd!()}/config.json") |> JSON.decode!()

  def conf do
    @conf
  end

  def domain do
    @conf["domain"]
  end

  def port do
    try do
      domain() |> String.split(":") |> Enum.reverse() |> hd() |> String.to_integer()
    rescue
      e in ArgumentError ->
        IO.inspect(e)
        3000
    end
  end
end
