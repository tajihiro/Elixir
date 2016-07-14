name = 'Tajima'
IO.puts(name)

{:ok, files} = File.ls("../")

{:ok, file} = File.open "filelist.txt", [:write]
#Enum.map(files, &IO.puts(&1))
Enum.map(files, &IO.write(file, &1<>"\n"))
File.close file