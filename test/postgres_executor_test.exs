defmodule PostgresExecutorTest do
  use ExUnit.Case
  doctest PostgresExecutor

  test "greets the world" do
    assert {:ok, output} =
             PostgresExecutor.execute_sql_file(
               "postgres://postgres:postgres@localhost:5432/postgres_test",
               "test/audit_trigger.sql"
             )
  end
end
