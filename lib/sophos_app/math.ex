defmodule SophosApp.Math do
  @moduledoc """
  Implementación básica del módulo de matemáticas de Sophos
  """

  @api 3.1415

  @doc """
  Suma dos numeros cualesquiera
  """
  def sum(a,b) do
    a + b
  end

  @doc """
  Calcula el area de un rectangulo
  """
  def area(a), do: area(a, a)
  def area(a, b), do: a * b

end
