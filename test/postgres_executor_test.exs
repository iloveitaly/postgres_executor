defmodule PostgresExecutorTest do
  use ExUnit.Case
  doctest PostgresExecutor

  test "fails on bad connection string" do
    assert {:error, _} =
             PostgresExecutor.execute_sql_file(
               "postgres://postgres:bad@localhost:5432/postgres_test",
               "test/audit_trigger.sql"
             )
  end

  test "fails on bad file reference" do
    assert {:error, _} =
             PostgresExecutor.execute_sql_file(
               "postgres://postgres:postgres@localhost:5432/postgres_test",
               "test/bad.sql"
             )
  end

  test "executes complex sql" do
    assert {:ok, output} =
             PostgresExecutor.execute_sql_file(
               "postgres://postgres:postgres@localhost:5432/postgres_test",
               "test/audit_trigger.sql"
             )

    IO.puts(output)
  end
end
