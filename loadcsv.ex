defmodule CalcLoadCsvFile do
    def sum() do
        result = "loaded.csv"
          |> File.stream!
          |> Stream.map(&(String.trim(&1)))
          |> Stream.map(&(String.split(&1, ",")))
          |> Stream.map(fn([key,val]) -> %{"key" => key, "val" => val} end)
          |> Enum.group_by(fn(pair) -> pair["key"] end, fn(pair) -> String.to_integer(pair["val"]) end)
          |> Enum.map(fn(pair) -> {elem(pair, 0), Enum.sum(elem(pair, 1))} end)
          |> Enum.map(fn({key, sum}) -> "#{key},#{sum}\n" end)
        File.write("loaded_result.txt", result)
        # IO.inspect result
    end
end
