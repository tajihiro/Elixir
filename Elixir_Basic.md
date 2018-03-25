# Elixir 勉強会
## Member
松永
田島
鹿島
椎名

## Tips

### Pattern Match
パターンマッチの結果、マッチした場合に値がバインドされる。
```
defmodule Match do
	def f(:a,x) do
		IO.puts "This is A!!"
	end
	def f(:b,x) do
		IO.puts "This is B!!"
	end
	def f(:c,x) do
		IO.puts "This is C!!"
	end

	#Match.f(:b, 1)
end
```

### Mix 
```
mix deps.get
mix deps.compile
```