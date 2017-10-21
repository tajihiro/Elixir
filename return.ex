# Elixirモジュールの組み立て方
defmodule Return do
    # 外部I/F定義
    def return(list) do
        #Listで引数を構成する
        _return(list, 0)
    end

    # Retrun値定義
    defp _return([], result), do: result

    # Logic定義 
    defp _return([head|tail], result) do
        #head値を処理
        _return(tail, (head + result))
    end
end