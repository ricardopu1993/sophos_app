defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci
  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)

      {:status, msg} ->
        IO.puts "Running #{inspect(msg)}"

      message ->
        IO.inspect(message)
    after
      1500 -> IO.puts("Se acabo")
    end
  end
end
