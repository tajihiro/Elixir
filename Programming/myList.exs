defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: len(tail) + 1
end