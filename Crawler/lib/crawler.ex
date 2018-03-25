defmodule Crawler do
  @moduledoc """
  Documentation for Crawler.
  """

  @doc """
  クロール処理開始
  """
  def start() do
    url = "https://www.geocoding.jp/api/?v=1.1&q=%E5%B9%B3%E4%BA%956-5-14"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
