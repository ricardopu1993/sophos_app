defmodule SophosApp.MyList do
  def sum(list) do
    sum(list, 0)
  end

  defp sum([h|t], n), do: sum(t, n + h)
  defp sum([], n), do: n

  def generate(n) when n > 0 do
    generate(n, [])
  end

  defp generate(0, list), do: list
  defp generate(n, list), do: generate(n - 1, [n | list])
end
