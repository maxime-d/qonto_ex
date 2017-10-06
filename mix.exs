defmodule QontoEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :qonto_ex,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      application: {QontoEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 0.8.0"},
      {:poison, ">= 1.0.0"}
    ]
  end
end
