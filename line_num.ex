defmodule FileModule do
	def line_count(file) do
		file
		  |> File.read
		  |> line_num
		# {:ok, content} = File.read("hello.ex")
		# c = String.split(content, "\n")
		# length(c)
	end

	def line_num({:ok, content}) do
		content
		  |> String.split("\n")
		  |> length
	end
	def line_num({:error, _}), do: :error
end