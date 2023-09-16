defmodule PostgresExecutorTest do
  use ExUnit.Case
  doctest PostgresExecutor

  test "greets the world" do
    assert PostgresExecutor.hello() == :world
  end
end
