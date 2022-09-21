defmodule SophosApp.FibonacciGenServer do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def compute(pid, n) do
    GenServer.cast(pid, {:sequence, n})
  end

  def status(pid) do
    GenServer.call(pid, :status)
  end

  def init(_args) do
    {:ok, %{}}
  end

end
