defmodule Main.Mixfile do
  use Mix.Project

  def project do
    [app: :main,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :alt],
     included_applications: [],
     mod: {Main, []}]
  end

  defp deps do
    [
        {:exrm, path: "../../../exrm"},
        {:alt,      in_umbrella: true},
        {:util,     in_umbrella: true}
    ]
  end
end
