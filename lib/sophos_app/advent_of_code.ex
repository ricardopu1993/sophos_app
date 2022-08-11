defmodule SophosApp.AdventOfCode.Day1 do
  alias SophosApp.MyList
  import String, only: [split: 3]

  def deliver(instructions) do
    instructions
    |> split("", trim: true)
    |> evaluate(0)
  end

  def deliver2(instructions) do
    instructions
    |> split("", trim: true)
    |> transform([])
    |> MyList.sum()
  end

  defp evaluate([], floor), do: floor

  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor + 1
  defp walk(floor, ")"), do: floor - 1

  defp transform([], list), do: list
  defp transform(["(" | t], list) do
    transform(t, [1 | list])
  end
  defp transform([")" | t], list) do
    transform(t, [-1 | list])
  end
end

defmodule SophosApp.AdventOfCode.Day2 do

  def exec(cadena) do
    String.split(cadena, "x")
    |> Enum.map(&String.to_integer/1)
    |> areaSuperficial()
  end

  defp areaSuperficial([l, w, h]) do
      areas = [l*w, w*h, l*h]
      min = Enum.min(areas)
      Enum.sum(areas)*2 + min
  end

end
