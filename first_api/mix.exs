defmodule FirstApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :first_api,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FirstApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:plug_cowboy, "~> 2.0"},
     {:jason, "~>1.4"}
    ]
  end
end
