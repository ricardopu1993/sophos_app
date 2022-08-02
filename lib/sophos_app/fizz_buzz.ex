defmodule SophosApp.FizzBuzz do
  def fizzBuzz(number),
    do: Enum.map(1..number, fn n -> fizzBuzz(rem(n, 3), rem(n, 5), n) end)
  defp fizzBuzz(0, 0, _n), do: :FizzBuzz
  defp fizzBuzz(0, _, _n), do: :Fizz
  defp fizzBuzz(_, 0, _n), do: :Buzz
  defp fizzBuzz(_, _, n), do: n
end
