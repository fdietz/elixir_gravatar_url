# ElixirGravatarUrl

An Elixir module for generating [Gravatar](http://gravatar.com) urls.

Port of the [gravatar-url](https://github.com/sindresorhus/gravatar-url) npm module.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add elixir_gravatar_url to your list of dependencies in `mix.exs`:

        def deps do
          [{:elixir_gravatar_url, "~> 0.0.1"}]
        end

  2. Ensure elixir_gravatar_url is started before your application:

        def application do
          [applications: [:elixir_gravatar_url]]
        end


## Example Usage

```
iex> ElixirGravatarUrl.url("jose.valim@plataformatec.com")
iex> ElixirGravatarUrl.url("jose.valim@plataformatec.com", s: 32)
iex> ElixirGravatarUrl.url("jose.valim@plataformatec.com", secure: false)
```
