defmodule ReadCSV do
    def read_csv() do
        File.stream!("loaded1.csv")
            |> Enum.map( &(String.trim(&1)))
            |> Enum.map( &(String.split(&1, ",")))
            |> Enum.map( &(IO.inspect(&1) ))
    end
end

result = ReadCSV.read_csv() |> Enum.to_list

IO.inspect(result)
