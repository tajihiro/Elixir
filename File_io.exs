defmodule FileIO do
    def main do
        {:ok, file} = File.open("sample.txt", [:read, :utf8])
        Enum.each(IO.stream(file, :line), fn(line) ->
            IO.puts line
        end )
        File.close(file)
    end
end
