defmodule Loop do
    def iterate([]), do: nil
    def iterate([head|tail]) do
        IO.puts head
        iterate(tail)
    end
end

defmodule HeadTail do
    def divide([head | tail]) do
        IO.puts "HEAD:" <> Integer.to_string(head)
        IO.puts "TAIL:" <> Enum.join(tail, ",")
    end
end
list = [1,2,3]

[head | tail] = list
IO.puts "HEAD:" <> Integer.to_string(head)
IO.puts "TAIL:" <> Enum.join(tail, ",")
Loop.iterate(list)