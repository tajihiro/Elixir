defmodule SpawnBasic do
    # def greet do
    #     IO.puts "こんにちは。たぢさん。"
    # end

    def greet do
        receive do
            {sender, msg} -> 
                send sender, {:ok, "Hello, #{msg}"}
                # greet
        end
    end
end

pid = spawn(SpawnBasic, :greet, [])
send pid, {self, "たぢさん"}
receive do
    {:ok, message}->
        IO.puts message
end

send pid, {self, "HIRO"}
receive do
    {:ok, message}->
        IO.puts message
    after 2000 ->
        IO.puts "Terminated!!!"
end