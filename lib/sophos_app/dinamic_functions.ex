defmodule SophosApp.DinamicFunctions do
  def apply_list(list, fun), do: apply_list(list, fun, [])
  defp apply_list([], _fun, list), do: list
  defp apply_list([h | t], fun, list), do: apply_list(t, fun, list ++ [fun.(h)])
end
