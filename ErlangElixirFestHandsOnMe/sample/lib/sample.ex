defmodule Sample do
  @moduledoc """
  Documentation for Sample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sample.hello
      :world

  """
  def hello do
    :world
  end

  def read_stream do
    data = File.stream!("data.json")
    Enum.take(data, 10)
  end
end
