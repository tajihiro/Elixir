defmodule FormatData do
  def format do
    lang_list = [%{id: 1, name: "Elixir"}, %{id: 2, name: "Java"}, %{id: 3, name: "Ruby"}, %{id: 4, name: "Python"}]
    sort_list = [%{id: 3, sort: 1}, %{id: 2, sort: 2}, %{id: 4, sort: 3}, %{id: 5, sort: 4}, %{id: 1, sort: 5}]

    Enum.group_by(lang_list ++ sort_list, &(&1.id))
      |> Enum.map(fn {_, [lang, sort]} -> Map.merge(lang, sort) end)
#      |> Enum.sort_by(&(&1.sort))
  end
end

#result_list = [%{id: 3, name: "Ruby", sort: 1},
#               %{id: 2, name: "Java", sort: 2},
#               %{id: 4, name: "Python", sort: 3},
#               %{id: 1, name: "Elixir", sort: 5}
#              ]
