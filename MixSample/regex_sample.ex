defmodule RegexSample do
    def regex do
        Regex.run ~r{[0-9]}, "あい1う2えお"
    end
end



