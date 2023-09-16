defmodule PostgresExecutor do
  @moduledoc """
  Documentation for `PostgresExecutor`.
  """

  @doc """
  Executes an arbitrary SQL file against a Postgres database using the CLI `psql` command.

  ## Examples

      iex> PostgresExecutor.execute_sql_file("postgres://postgres:postgres@localhost:5432/mydb", "priv/some.sql")
      {ok, "..."}

  """
  def execute_sql_file(database_url, file_path)
      when is_binary(database_url) and is_binary(file_path) do
    %URI{
      userinfo: userinfo,
      host: db_host,
      port: port,
      path: path
    } = URI.parse(database_url)

    [db_user, db_password] = String.split(userinfo, ":", parts: 2)
    # Remove the leading "/" from the path to get the database name
    db_name = path |> String.trim_leading("/")

    command = "psql"
    db_port = Integer.to_string(port)

    args = [
      "-h",
      db_host,
      "-p",
      db_port,
      "-U",
      db_user,
      "-d",
      db_name,
      # raise errors
      "--set",
      "ON_ERROR_STOP=ON",
      "--echo-all",
      "--echo-errors",
      "--file",
      file_path
    ]

    env = [{"PGPASSWORD", db_password}]

    {result, exit_code} = System.cmd(command, args, env: env)

    case exit_code do
      0 -> {:ok, result}
      _ -> {:error, result}
    end
  end
end
