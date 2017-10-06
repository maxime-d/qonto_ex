# QontoEx

Simple client for Qonto's API written in Elixir, read
official documentation [here](https://api-doc.qonto.eu/).

## Installation

QontoEx package can be installed by adding `qonto_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:qonto_ex, "~> 0.1.0"}
  ]
end
```

## Usage

Find your Qonto credentials in your application settings and copy then in `/config/secret.exs`.

```elixir
# /config/secret.exs

use Mix.Config

config :qonto_ex, slug: "<YOUR SLUG>"
                  secret_key: "<YOUR SECRET KEY>"
```


#### Organization
```elixir
iex(1) response = QontoEx.organization
```

#### List transactions
```elixir
iex(1) params = [iban: "*iban*", current_page: "1"]
response = QontoEx.transactions(client, params)
```