fizz_buzz = fn 
   ( 0, 0, _ )-> IO.puts "FizzBuzz"
   ( 0, _, _ )-> IO.puts "Buzz"
   ( _, 0, _ )-> IO.puts "Fizz"
   ( _, _, x )-> IO.puts x
end

fizz_buzz.(0, 0, 1)
fizz_buzz.(0, 1, 1)
fizz_buzz.(1, 0, 1)
fizz_buzz.(1, 1, 5)

