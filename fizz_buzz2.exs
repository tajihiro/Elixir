fizz_buzz = fn 
   ( 0, 0, _ )-> IO.puts "FizzBuzz"
   ( 0, _, _ )-> IO.puts "Fizz"
   ( _, 0, _ )-> IO.puts "Buzz"
   ( _, _, x )-> IO.puts x
end

fizz_buzz2 = fn (n)
    -> fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

# range = 10..17
# list = Enum.to_list(range)
# Enum.map(list, &(fizz_buzz2.(&1)))

#Enum.map(Enum.to_list(10..17), fn(x) -> fizz_buzz2.(x) end)
Enum.map(Enum.to_list(10..17), &(fizz_buzz2.(&1)))

