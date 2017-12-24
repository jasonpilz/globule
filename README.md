# Globule

Simple utility to combine a repo of source code into a single file, suitable for
using as overlay data in creating a code poster, along the lines of [commits.io](https://commits.io/)

## Usage

There is an executable included, `globule`, which can be run on any system with
erlang installed.

`cd` into project directory where desrired source code is and run
```sh
globule
```

This will output a file, `./glob` containing all source contained in the default
folders, and having the default file extensions.

Default folders:
* './app'
* './lib'
* './test'
* './spec'

Default extensions:
* '.ex'
* '.exs'
* '.rb'
* '.js'

TODO:
[ ] Accept source dirs and extensions as arguments, or via a config file

## Installation

To install the executable locally, from this project root directory, run:
```sh
mix escript.install
```

Adding your `escripts` directory to your `PATH` will allow convinient invocation.
More info [here](https://hexdocs.pm/mix/Mix.Tasks.Escript.Install.html#content)

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `globule` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:globule, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/globule](https://hexdocs.pm/globule).

