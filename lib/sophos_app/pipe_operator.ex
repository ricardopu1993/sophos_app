defmodule SophosApp.PipeOperator do
  def filter_current_files() do
    "."
    |> Path.join("**/*.ex")
    |> Path.wildcard()
    |> Enum.filter(fn f ->
      String.contains?(Path.basename(f), "application")
    end)
  end
end
