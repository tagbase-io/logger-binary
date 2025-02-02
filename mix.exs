defmodule LoggerBinary.MixProject do
  use Mix.Project

  def project do
    [
      app: :logger_binary,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A custom Logger formatter for handling binary data.",
      package: package(),
      docs: docs()
    ]
  end

  defp package do
    [licenses: ["MIT"], links: %{"GitHub" => "https://github.com/tagbase-io/logger-binary"}]
  end

  defp docs do
    [main: "LoggerBinary"]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.36.1", only: :dev, runtime: false},
      {:styler, "~> 1.2", only: [:dev, :test], runtime: false}
    ]
  end
end
