defmodule PostgresExecutorTest do
  use ExUnit.Case
  doctest PostgresExecutor

  @database_connection "postgres://postgres:postgres@localhost:5432/postgres_test"

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
               @database_connection,
               "test/bad.sql"
             )
  end

  test "executes complex sql" do
    assert {:ok, output} =
             PostgresExecutor.execute_sql_file(
               @database_connection,
               "test/audit_trigger.sql"
             )

    IO.puts(output)

    assert {:ok, output} =
             PostgresExecutor.execute_sql_file(
               @database_connection,
               "test/drop_audit.sql"
             )
  end
end
