defmodule SophosApp.GenericServer do
  def start(module, init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn_link(__MODULE__, :loop, [module, caller, init])
  end

  def loop(module, caller, state) do
    receive do
      msg ->
        {:ok, result, new_state} = module.handle_message(msg, caller, state)
        send(caller, result)
        loop(module, caller, new_state)
    end
  end

  def start_process(module, from, init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn(__MODULE__, :loop_change_process, [module, caller, init])
  end


  def loop_change_process(module, caller, state) do
    receive do
      {sender, msg} ->
        {:ok, result, new_state} = module.handle_message({sender, msg}, caller, state)
        send(sender, result)
        loop_change_process(module, sender, new_state)
    end
  end


  def handle_ping(msg) do
    receive do
      {:ok, from, msg} ->
        msg_update = action(msg)
        log(from, self(), msg_update, :ok)
        send(from, msg_update)
        handle_ping(msg_update)
    end
  end


  def log(pid, from, msg, :ok) do
    IO.inspect(("#{:erlang.pid_to_list(pid)} responded #{msg}"))
    :timer.sleep(2000)
    msg_update = action(msg)
    send(pid, msg_update)
    log(from, pid, msg_update, :ok)
  end

  def show_msg do
    receive do
      {:print, value} -> value
    end
  end

  defp action(msg) when msg != :ping and msg != :pong, do: :ping
  defp action(msg) when msg == :ping, do: :pong
  defp action(msg) when msg == :pong, do: :ping

end