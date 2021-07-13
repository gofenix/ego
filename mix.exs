defmodule Ego.MixProject do
  use Mix.Project

  def project do
    [
      app: :ego,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :eex],
      # mod: {Ego, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:earmark, "~> 1.4.15"},
      {:plug_cowboy, "~> 2.0"},
      {:json, "~> 1.4"},
      {:dialyxir, "~> 0.4", only: [:dev]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  def escript do
    [main_module: Ego]
  end
end
