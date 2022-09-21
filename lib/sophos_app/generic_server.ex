defmodule SophosApp.GenericServer do

  def start(module, init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn_link(__MODULE__, :loop, [module, caller, init])
  end

  def loop(module, caller, state) do
    receive do
      {pid, evt} ->
        {:ok, result, new_state} = module.handle_event({pid, evt}, caller, state)
        send(pid, result)
        loop(module, pid, new_state)
    end
  end


    def start_process(module, init, caller \\ self()) do
      Process.flag(:trap_exit, true)
      spawn(__MODULE__, :loop, [module, caller, init])
    end

end
