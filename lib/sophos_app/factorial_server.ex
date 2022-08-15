defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message(caller) do
    receive do
      {:compute, n} ->
        result = Factorial.of(n)
        send(caller, {:compute, n, result})
        handle_message(caller)

       {:status} ->
         send(caller, {:ok, caller})
         handle_message(caller)

       {:exit, reason} ->
         IO.puts("bye for #{inspect(reason)}")

       message ->
         IO.inspect(message)
         handle_message("Bad Operation")
         # after
        #   1500 -> IO.puts("Se acabó")
    end
  end
end
