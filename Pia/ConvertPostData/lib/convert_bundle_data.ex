defmodule ConvertBundleData do
  use Timex
  def convert do
    start_at = Timex.now("Asia/Tokyo")
    format_date = Timex.format!(start_at, "%Y%m%d", :strftime)
    IO.puts "START : " <> Timex.format!(start_at, "%Y/%m/%d %H:%M:%S", :strftime)
    headers = [:bundle_id, :country, :request_id, :ticket_no, :first_name_en, :last_name_en, :last_name_kj, :first_name_kj,
      :account_id, :remark_01_ja, :remark_01_en, :remark_02_ja, :remark_02_en, :product_name_en, :product_name_ja, :price,
      :seat, :row, :level, :entrance, :gate, :venue, :seat_info,
      :postal_cd_01, :building_01, :street_01, :city_01, :prefecture_01, :full_name_en_01, :full_name_en_02,
      :building_02, :street_02, :city_02, :country_cd, :city_03, :prefecture_02,
      :postal_cd_02, :tel01, :tel02, :email, :vat, :product_id, :product_id_02, :sort_id, :product_name]
      out_file = "C:\\Works\\TASKS\\20190426_PrintTicketsBundleData\\output\\RWC2019_B_" <> format_date <> ".tsv"
      result = "C:\\Works\\TASKS\\20190426_PrintTicketsBundleData\\input\\bdl_merged.tsv"
#      out_file = "./output/RWC2019_B_" <> format_date <> ".tsv"
#      result = "./input/bdl_merged.tsv"
               |> File.stream!
               |> CSV.decode(separator: ?\t, headers: headers)
#               |> NimbleCSV.RFC4180.parse_stream()
               |> Flow.from_enumerable(stages: 1)
               |> Flow.map(&(elem(&1, 1)))
               |> Flow.group_by(&{&1.request_id, &1.ticket_no})
               |> Flow.map(&(format_data(&1)))
               |> Enum.to_list()
#               |> Enum.map(&(elem(&1, 1)))
#               |> Enum.group_by(&{&1.request_id, &1.ticket_no})
#               |> Enum.map(&(format_data(&1)))
      File.write(out_file, result)
    end_at = Timex.now("Asia/Tokyo")
    total_time = DateTime.diff(end_at, start_at)
    IO.puts "It tooks " <> Integer.to_string(total_time) <> " minutes."
    IO.puts "END : " <> Timex.format!(end_at, "%Y/%m/%d %H:%M:%S", :strftime)
  end

  defp price_check(price) when is_nil(price), do: 0
  defp price_check(price) do
    String.to_integer(price)
#    Kernel.trunc(String.to_float(price))
  end

  defp format_data{{request_id, ticket_no}, values} do
    dhl_cols = case Enum.at(values, 0)[:country_cd] do
      "JP" ->
        "\t\t\t\t\t\t\t\t\t\t\t\t"
      _ ->
        "\t#{Enum.at(values, 0)[:full_name_en_01]}" <>  #62 Company Name
        "\t#{Enum.at(values, 0)[:full_name_en_02]}" <>  #63 Attention Name
        "\t#{Enum.at(values, 0)[:building_02]}" <>      #64 Address1
        "\t#{Enum.at(values, 0)[:street_02]}" <>        #65 Address2
        "\t#{Enum.at(values, 0)[:city_02]}" <>          #66 Address3
        "\t#{Enum.at(values, 0)[:country_cd]}" <>       #67 Country Code
        "\t#{Enum.at(values, 0)[:city_03]}" <>          #68 City
        "\t#{Enum.at(values, 0)[:prefecture_02]}" <>    #69 State
        "\t#{Enum.at(values, 0)[:postal_cd_02]}" <>     #70 ZIP Code
        "\t#{Enum.at(values, 0)[:tel01]}" <>            #71 Phone Number
        "\t#{Enum.at(values, 0)[:tel02]}" <>            #72 Mobile Phone Number
        "\t#{Enum.at(values, 0)[:email]}"               #73 Email Address
    end
    total_price = price_check(Enum.at(values, 0)[:price]) + price_check(Enum.at(values, 1)[:price])+ price_check(Enum.at(values, 2)[:price]) + price_check(Enum.at(values, 3)[:price]) + price_check(Enum.at(values, 4)[:price])

    "#{Enum.at(values, 0)[:bundle_id]}" <>          #01 PRODUCT ID (SET)
    "\t#{Enum.at(values, 0)[:country]}" <>          #02 COUNTRY CD
    "\t#{request_id}" <>                            #03 チケット申込番号
    "\t#{ticket_no}" <>                             #04 発券番号
    "\t#{Enum.at(values, 0)[:first_name_en]}" <>    #05 First Name
    "\t#{Enum.at(values, 0)[:last_name_en]}" <>     #06 Last Name
    "\t#{Enum.at(values, 0)[:last_name_kj]}" <>     #07 姓
    "\t#{Enum.at(values, 0)[:first_name_kj]}" <>    #08 名
    "\t#{Enum.at(values, 0)[:account_id]}" <>       #09 ACCOUNT ID
    "\t#{Enum.at(values, 0)[:remark_01_ja]}" <>     #10 備考1 日
    "\t#{Enum.at(values, 0)[:remark_01_en]}" <>     #11 備考1 英
    "\t#{Enum.at(values, 0)[:remark_02_ja]}" <>     #12 備考2 日
    "\t#{Enum.at(values, 0)[:remark_02_en]}" <>     #13 備考2 英
    "\t#{Enum.at(values, 0)[:product_name_en]}" <>  #14 カテゴリ 英
    "\t#{Enum.at(values, 0)[:product_name_ja]}" <>  #15 カテゴリ 日
    "\t#{total_price}" <>                           #16 金額
    "\t#{Enum.at(values, 0)[:product_id]}" <>       #17 PRODUCT ID (Match01)
#    "\t#{Enum.at(values, 0)[:sort_id]}" <>          #-- sort id (Match01)
#    "\t#{Enum.at(values, 0)[:product_name]}" <>     #-- product (Match01)
    "\t#{Enum.at(values, 0)[:seat]}" <>             #18 席情報1
    "\t#{Enum.at(values, 0)[:row]}" <>              #19 席情報2
    "\t#{Enum.at(values, 0)[:level]}" <>            #20 席情報3
    "\t#{Enum.at(values, 0)[:entrance]}" <>         #21 席情報4
    "\t#{Enum.at(values, 0)[:gate]}" <>             #22 席情報5
    "\t#{Enum.at(values, 0)[:venue]}" <>            #23 席情報6
    "\t#{Enum.at(values, 0)[:seat_info]}" <>        #24 席情報7
    "\t#{Enum.at(values, 1)[:product_id]}" <>       #25 PRODUCT ID (Match02)
#    "\t#{Enum.at(values, 1)[:sort_id]}" <>          #-- sort id (Match02)
#    "\t#{Enum.at(values, 1)[:product_name]}" <>     #-- product (Match02)
    "\t#{Enum.at(values, 1)[:seat]}" <>             #26 席情報1
    "\t#{Enum.at(values, 1)[:row]}" <>              #27 席情報2
    "\t#{Enum.at(values, 1)[:level]}" <>            #28 席情報3
    "\t#{Enum.at(values, 1)[:entrance]}" <>         #29 席情報4
    "\t#{Enum.at(values, 1)[:gate]}" <>             #30 席情報5
    "\t#{Enum.at(values, 1)[:venue]}" <>            #31 席情報6
    "\t#{Enum.at(values, 1)[:seat_info]}" <>        #32 席情報7
    "\t#{Enum.at(values, 2)[:product_id]}" <>       #33 PRODUCT ID (Match03)
#    "\t#{Enum.at(values, 2)[:sort_id]}" <>          #-- sort id (Match03)
#    "\t#{Enum.at(values, 2)[:product_name]}" <>     #-- product (Match03)
    "\t#{Enum.at(values, 2)[:seat]}" <>             #34 席情報1
    "\t#{Enum.at(values, 2)[:row]}" <>              #35 席情報2
    "\t#{Enum.at(values, 2)[:level]}" <>            #36 席情報3
    "\t#{Enum.at(values, 2)[:entrance]}" <>         #37 席情報4
    "\t#{Enum.at(values, 2)[:gate]}" <>             #38 席情報5
    "\t#{Enum.at(values, 2)[:venue]}" <>            #39 席情報6
    "\t#{Enum.at(values, 2)[:seat_info]}" <>        #40 席情報7
    "\t#{Enum.at(values, 3)[:product_id]}" <>       #41 PRODUCT ID (Match04)
#    "\t#{Enum.at(values, 3)[:sort_id]}" <>          #-- sort id (Match04)
#    "\t#{Enum.at(values, 3)[:product_name]}" <>     #-- product (Match04)
    "\t#{Enum.at(values, 3)[:seat]}" <>             #42 席情報1
    "\t#{Enum.at(values, 3)[:row]}" <>              #43 席情報2
    "\t#{Enum.at(values, 3)[:level]}" <>            #44 席情報3
    "\t#{Enum.at(values, 3)[:entrance]}" <>         #45 席情報4
    "\t#{Enum.at(values, 3)[:gate]}" <>             #46 席情報5
    "\t#{Enum.at(values, 3)[:venue]}" <>            #47 席情報6
    "\t#{Enum.at(values, 3)[:seat_info]}" <>        #48 席情報7
    "\t#{Enum.at(values, 4)[:product_id]}" <>       #49 PRODUCT ID (Match05)
#    "\t#{Enum.at(values, 4)[:sort_id]}" <>          #-- sort id (Match05)
#    "\t#{Enum.at(values, 4)[:product_name]}" <>     #-- product (Match05)
    "\t#{Enum.at(values, 4)[:seat]}" <>             #50 席情報1
    "\t#{Enum.at(values, 4)[:row]}" <>              #51 席情報2
    "\t#{Enum.at(values, 4)[:level]}" <>            #52 席情報3
    "\t#{Enum.at(values, 4)[:entrance]}" <>         #53 席情報4
    "\t#{Enum.at(values, 4)[:gate]}" <>             #54 席情報5
    "\t#{Enum.at(values, 4)[:venue]}" <>            #55 席情報6
    "\t#{Enum.at(values, 4)[:seat_info]}" <>        #56 席情報7
    "\t#{Enum.at(values, 0)[:postal_cd_01]}" <>     #57 送付先郵便番号
    "\t#{Enum.at(values, 0)[:prefecture_01]}" <>    #58 送付先住所1
    "\t#{Enum.at(values, 0)[:city_01]}" <>          #59 送付先住所2
    "\t#{Enum.at(values, 0)[:street_01]}" <>        #60 送付先住所3
    "\t#{Enum.at(values, 0)[:building_01]}" <>      #61 送付先住所4
    dhl_cols <>                                      #62-73
    "\t#{Enum.at(values, 0)[:vat]}\r\n"             #74 VAT
  end

end
