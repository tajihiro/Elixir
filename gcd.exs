defmodule GcdSample do
    def gcd(x, 0) do 
        x
    end
    def gcd(x, y) do
        gcd(y, rem(x, y)) 
    end     
end

IO.puts GcdSample.gcd(20,15)
IO.puts GcdSample.gcd(20,16)
IO.puts GcdSample.gcd(20,17)
