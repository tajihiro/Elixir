defmodule Sample do
  def group_by_map do
      m01 = %{id: 1, lang: "Elixir"}
      m02 = %{id: 2, lang: "Java"}
      m03 = %{id: 2, lang: "Ruby"}
      m04 = %{id: 3, lang: "Python"}
      Enum.group_by([m01, m02, m03, m04], &(&1.id))
#        |> Enum.map(fn %{} -> IO.puts "" end)
  end

  def group_by_sum do
    m01 = %{id: 1,  price: 120}
    m02 = %{id: 2,  price: 110}
    m03 = %{id: 2,  price: 100}
    m04 = %{id: 3,  price: 80}
    Enum.group_by([m01, m02, m03, m04], &(&1.id))
      |> Enum.map(fn {_id, data} ->  data end)
#      |> Enum.reduce(%{}, & Map.merge(&2, %{&1.id => (&2[&1.id] || 0) + &1.price}))
  end

end
