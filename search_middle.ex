defmodule SearchMiddle do
    def guess(actual, range=low..high) do
        guess = div((high+low), 2)
        IO.puts "Is it #{guess}?"
        _guess(actual, guess, range)
    end

    defp _guess(actual, actual, _) do
        IO.puts "Yes, it's #{actual}!!!"
    end

    defp _guess(actual, guess, _low..high) when guess < actual do
        guess(actual, guess+1..high) 
    end

    defp _guess(actual, guess, low.._high) when guess > actual do
        guess(actual, low..guess-1) 
    end
end

SearchMiddle.guess(5, 0..10)