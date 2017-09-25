defmodule Capitalize do
    def capitalize_sentences(target) do
        target 
        |> String.split(~r{\.\s+})
        |> Enum.map(&String.capitalize(&1))
        |> Enum.join(". ")    
    end
end

IO.inspect Capitalize.capitalize_sentences("oh. a DOG. woof.")
