defmodule Ego do
  @moduledoc """
  Documentation for `Ego`.
  """
  def main(args \\ []) do
    # args |> parse_args() |> response() |> IO.inspect()

    if length(args) < 1 do
      Mark.convert()
    else
      parse_args(args)
    end
  end

  defp parse_args(args) do
    case hd(args) do
      "server" ->
        start_server()

      "build" ->
        Mark.convert()

      "new" ->
        gen_template(args)
    end
  end

  defp start_server do
    Plug.Cowboy.http(MyPlug, [])
    :timer.sleep(:infinity)
  end

  defp gen_template(args) do
    [_, cmd, name | _] = args

    IO.inspect(cmd)

    case cmd do
      "site" ->
        gen_site(name)

      _ ->
        IO.inspect("只能创建 site ")
    end

    IO.inspect(name)
  end

  defp gen_site(name) do
    "#{File.cwd!()}/#{name}" |> File.mkdir_p!()
    "#{File.cwd!()}/#{name}/layouts" |> File.mkdir_p!()
    "#{File.cwd!()}/#{name}/contents" |> File.mkdir_p!()

    File.write!("#{File.cwd!()}/#{name}/layouts/blog.eex", Layout.blog())
    File.write!("#{File.cwd!()}/#{name}/layouts/index.eex", Layout.index())
    File.write!("#{File.cwd!()}/#{name}/contents/hello_world.md", Layout.hello_world())
    File.write!("#{File.cwd!()}/#{name}/config.json", Layout.config())
  end
end
