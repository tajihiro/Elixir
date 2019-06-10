defmodule Flatten do
	def flatten([]) do
		[]
	end
	def flatten([head | tail]) do
		flatten(head) ++ flatten(tail)
	end
	def flatten(head) do
		[head]
	end

end
