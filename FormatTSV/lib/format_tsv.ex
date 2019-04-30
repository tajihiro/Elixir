defmodule FormatTsv do
  def convert do
    headers = [:id, :name, :lang]
    out_file = "out.tsv"
    result = "data.tsv"
      |> File.stream!
      |> CSV.decode(separator: ?\t, headers: headers)
      |> Enum.map(&(elem(&1, 1)))
      |> Enum.group_by(fn(x)-> x[:id] end)
      |> Enum.map(fn {id, values} -> 
                    "#{id}\t#{Enum.at(values, 0)[:name]}\t#{Enum.at(values, 0)[:lang]}\t#{Enum.at(values, 1)[:lang]}\t#{Enum.at(values, 2)[:lang]}\n"
                  end)
    File.write(out_file, result)
  end
end
