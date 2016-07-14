#{:ok, file} = File.read "non_exist_file.txt"
#{:error, file} = File.read "non_exist_file.txt"
#IO.puts file

case File.read "non_exist_file.txt" do
    {:ok, file} -> IO.puts "OK!!"
    {:error, enoent} -> IO.puts "File not found Error!!"
end
