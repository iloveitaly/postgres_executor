# Postgres Raw SQL Executor for Elixir

A simple utility to execute SQL files against a Postgres database using the `psql` command-line interface. Useful when you need to execute multi-statement SQL. More information in this blog post (TODO).

## Installation

1. Add `postgres_executor` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:postgres_executor, "~> 0.2.0"}
  ]
end
```

2. Run `mix deps.get` to fetch the dependency.

## Usage

Here's a basic example of how to use the `PostgresExecutor`:

```elixir
# Execute an SQL file against a Postgres database
{:ok, result} = PostgresExecutor.execute_sql_file("postgres://postgres:postgres@localhost:5432/mydb", "priv/path_to_file.sql")
```

### Configuration

Make sure you have `psql` command-line utility installed and accessible from your environment. There is no error detection for this case.

## Testing

Mocking has been set up for easy testing. Use the included mock utilities to write your tests without actually hitting a Postgres database.

To update the audit trigger SQL:

```shell
http https://raw.githubusercontent.com/iloveitaly/audit-trigger/master/audit.sql > test/audit_trigger.sql
```

## Contributing

1. Fork the repository on GitHub.
2. Clone the forked repo and make your changes.
3. Submit a pull request to the main branch.

All contributions are welcomed!

## License

MIT License. See [LICENSE](LICENSE) for more details.

## TODO

- [ ] tests (I'm lazy)
- [ ] check if psql is installed