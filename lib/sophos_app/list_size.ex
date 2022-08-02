defmodule SophosApp.ListSize do
  def size(list), do: size(list, 0)
  defp size([], n), do: n
  defp size([_h | t], n), do: size(t, n + 1)
end
