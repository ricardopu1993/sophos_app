defmodule SophosApp.PinPong do
  def handle_event({pid_sender, turn}, _caller, state) do
    IO.puts("PID #{inspect(pid_sender)}, turn #{inspect(turn)}")
    :timer.sleep(1000)
    result = switch(turn)
    {:ok, {self(), result}, [result | state]}
  end

  def handle_event({:status}, _caller, state) do
    {:ok, state, state}
  end

  def switch(action) when action == :ping, do: :pong

  def switch(action) when action == :pong, do: :ping
end
