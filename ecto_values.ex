# results = {:ok, %Mariaex.Result{columns: [item_id, item_name, date_format(S.inserted_at, '%H%i'), h0000], connection_id: nil, last_insert_id: nil, num_rows: 1, rows: [[42, とうもろこし, 1115, %Decimal{coef: 0, exp: 0, sign: 1}]]}}
columns = [:item_id, :item_name]
rows = [1,"tajima"]
result = Enum.zip(columns, rows)
IO.puts result



