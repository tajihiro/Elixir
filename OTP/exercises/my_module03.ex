defmodule Crypto do
	def convert_md5 do
	  :crypto.hash(:md5, "Whoocus")
	#   :crypto.md5("Whoocus")
	    |> Base.encode16(case: :lower)
	end
end