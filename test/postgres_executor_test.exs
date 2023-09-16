defmodule PostgresExecutorTest do
  use ExUnit.Case
  doctest PostgresExecutor

  test "greets the world" do
    assert PostgresExecutor.execute_sql_file() == :world
  end
end
