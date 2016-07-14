str1 = "123"
int1 = String.to_integer(str1)
IO.puts str1 <> "2" # => "1232"
IO.puts int1 + 2    # => 125

str2 = "abc"
IO.puts String.upcase(str2) # => "ABC"

str3 = "param"
IO.puts String.to_atom(str3) # => :param

str4 = "Elixir"
IO.puts String.slice(str4, 1..3) # => "lix"

str5 = "   Elixir   "
IO.puts String.strip(str5)    # => "Eixir"
IO.puts String.lstrip(str5)   # => "Eixir   "
IO.puts String.rstrip(str5)   # => "   Eixir"

str6 = "a,b,c,d"
IO.puts String.replace(str6, ",", "-") # => "a-b-c-d"

str7 = "abcdefg"
IO.puts String.at(str7, 3)   # => "d"
IO.puts String.at(str7, -1)  # => "g"


