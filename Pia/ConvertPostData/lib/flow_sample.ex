defmodule FlowSample do
  def execute do
#    list = [
#      {{"100", "100-0"}, [
#          %{id: "001", name: "Elixir", sort_id: "1"},
#          %{id: "002", name: "Java", sort_id: "3"},
#          %{id: "003", name: "Ruby", sort_id: "2"}
#        ]
#      },
#      {{"200", "100-0"}, [
#        %{id: "001", name: "erlang", sort_id: "1"},
#        %{id: "002", name: "C#", sort_id: "3"},
#        %{id: "003", name: "Python", sort_id: "2"}
#        ]
#      }
#    ]
    list = [
      {{'a'}, %{id: 1, name: "Elixir"}},
      {{'c'}, %{id: 3, name: "Java"}},
      {{'b'}, %{id: 2, name: "Python"}}
    ]
    list
      |> Enum.map(fn({_, x}) -> Enum.sort(x) end)
  end
end