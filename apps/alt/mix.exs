defmodule Alt.Mixfile do
  use Mix.Project

  def project do
    [app: :alt,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger],
     included_applications: [:util],
     mod: {Alt, []}]
  end

  defp deps do
    [
        {:exrm,     git: "https://github.com/bitwalker/exrm.git",       branch: "master"},
        {:util,     in_umbrella: true}
    ]
  end
end
