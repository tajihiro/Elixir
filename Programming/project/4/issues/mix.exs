#---
# Excerpted from "Programming Elixir 1.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir12 for more book information.
#---
defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [ app:             :issues,
      escript:         escript_config,
      version:         "0.0.1",
      elixir:          "~> 1.2",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:            deps ]
  end

  # Configuration for the OTP application
  def application do
    [ 
      applications: [ :logger, :httpoison ]
    ]
  end

  defp deps do
    [
      httpoison: "~> 0.5",
      poison:    "~> 1.5"
    ]
  end

  defp escript_config do
    [ main_module: Issues.CLI ]
  end
end
