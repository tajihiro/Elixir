defmodule FormatCsv do
  def convert do
    headers = [:id, :name, :venue, :category]
    out_file = "out.csv"
    result = "data.csv"
      |> File.stream!
      |> CSV.decode(separator: ?,, headers: headers)
      |> Enum.map(&(elem(&1, 1)))
      |> Enum.group_by(fn(x)-> x[:id] end)
      |> Enum.map(fn {id, values} -> 
                    "#{id},#{Enum.at(values, 0)[:name]},#{Enum.at(values, 0)[:venue]},#{Enum.at(values, 0)[:category]},#{Enum.at(values, 1)[:venue]},#{Enum.at(values, 1)[:category]},#{Enum.at(values, 2)[:venue]},#{Enum.at(values, 2)[:category]}\n"
                  end)
    File.write(out_file, result)
  end
end
