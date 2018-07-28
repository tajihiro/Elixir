defmodule Sample01 do
	def read_enum() do
		data = File.read!("data.json")
#		IO.puts data
	end

	def read_stream() do
		data = File.stream!("data.json")
		Enum.take(data, 2)
	end

	def read_flow() do
		data = File.read!("data.json")
	end
	
end