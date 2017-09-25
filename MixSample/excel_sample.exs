defmodule ExcelSample do
    def show_sheet_names do
        sheets = Excelion.get_worksheet_names("elixir.xlsx")
        IO.inspect(sheets)
    end

    def convert do
        sheet_no = 0
        result = "elixir.xlsx"
          |> Excelion.parse(sheet_no, 1)
          |> elem(1)
          |> Enum.map(&([Enum.at(&1,2), Enum.at(&1,7)]))
          |> Enum.filter(&(Enum.at(&1,0) != ""))
          |> Enum.filter(&(Regex.run ~r{[0-9]}, Enum.at(&1,0)))
          |> Enum.map(fn([no, name])->[no, String.split(name)] end)
          |> Enum.map(fn([no, [last_name, first_name]]) -> "\"#{no}\",\"#{last_name}\",\"#{first_name}\"\n" end)

        # rows = Excelion.parse("elixir.xlsx", sheet_no, 1)
        # list = elem(rows, 1)
        # numbers = Enum.map(list, fn(l) -> String.trim(Enum.at(l, 2)) end)
        # members = Enum.map(list, fn(l) -> String.trim(Enum.at(l, 7)) end)
        # member_tuple = Enum.zip(numbers, members)
        # member_data = Enum.filter(member_tuple, &(elem(&1, 1) != ""))
        # result = Enum.map(member_data, fn({no,name}) -> "\"#{no}\",\"#{name}\"\n" end)
        File.write("roster.csv", result)
        # File.write("/Users/tajihiro/Desktop/roster.csv", result)
    end
end
