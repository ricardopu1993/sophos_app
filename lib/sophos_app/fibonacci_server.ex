defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [0])
  end

  def start_link() do
    spawn_link(__MODULE__, :loop, [0])
  end

  def start_monitor() do
    spawn_monitor(__MODULE__, :loop, [0])
  end

  def loop(counter) do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        IO.inspect(caller)
        IO.inspect(self())
        send(caller, {:fibonacci, n, result})
        loop(counter + 1)

       {:status, caller} ->
         send(caller, {:ok, counter})
         loop(counter)

       {:exit, reason} ->
         IO.puts("bye for #{inspect(reason)}")

       message ->
         IO.inspect(message)
         loop(counter)
         # after
        #   1500 -> IO.puts("Se acabó")
    end
  end
end
