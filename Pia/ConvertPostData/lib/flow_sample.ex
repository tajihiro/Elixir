defmodule FlowSample do
  def execute do
    1..100000
      |> Flow.map
  end
end