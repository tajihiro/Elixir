defmodule Hiroyuki do
    def greet do
        receive do
            {sender, msg} ->
                IO.puts "わたしは、#{msg}"
                send sender, {:ok, "こちらこそ～"}
        end
    end    
end

msg_to_hiro = spawn(Hiroyuki, :greet, [])
send msg_to_hiro, {self, "たぢさん"}

receive do
    {:ok, msg} -> IO.puts msg
end