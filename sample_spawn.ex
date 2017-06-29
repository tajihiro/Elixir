defmodule SampleSpawn do
    def hello(person) do
        IO.puts "Hello, #{person}. My PID is #{inspect self()}."
        receive do
            message -> IO.puts "Message is #{message}."
        end
    end
end