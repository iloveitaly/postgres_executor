defmodule PostgresExecutor.MixProject do
  use Mix.Project

  def project do
    [
      app: :postgres_executor,
      version: "0.2.4",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      package: package(),
      test_coverage: [tool: ExCoveralls],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.18.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description:
        "An Elixir utility to execute SQL files on Postgres using psql CLI, supporting multi-statement SQL with mock testing capabilities",
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md"],
      maintainers: ["Michael Bianco"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/iloveitlay/postgres_executor"}
    ]
  end
end
