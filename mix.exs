defmodule PostgresExecutor.MixProject do
  use Mix.Project

  def project do
    [
      app: :postgres_executor,
      version: "0.2.1",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      description:
        "An Elixir utility to execute SQL files on Postgres using psql CLI, supporting multi-statement SQL with mock testing capabilities",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/iloveitlay/postgres_executor"
      },

      # Add this line. Adjust the link accordingly.
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
      {:excoveralls, "~> 0.17.1", only: :test}
    ]
  end
end
