defmodule MyFunc do
  def fnc([]), do: 0
  def fnc([ head | tail ]) do
    IO.puts(head);
    fnc(tail);
  end
end

defmodule MyFunc2 do
  def fnc([]), do: 0
  def fnc([ head | tail ]) do
    IO.puts(head);
    fnc(tail);
  end
end


list = [1,2,3,4,5];
MyFunc.fnc(list);
IO.puts("----------")
MyFunc2.fnc(list);

