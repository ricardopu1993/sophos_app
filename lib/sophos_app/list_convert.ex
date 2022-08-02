defmodule SophosApp.ListConvert do
    def apply(list, "*"), do: Enum.map(list, fn x -> x * x end)
    def apply(list, "+"), do: Enum.map(list, fn x -> x + x end)
    def apply(list, "-"), do: Enum.map(list, fn x -> x - x end)
    def apply(list, "/"), do: Enum.map(list, fn x -> x / x end)
end
