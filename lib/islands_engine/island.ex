defmodule IslandsEngine.Island do
  alias IslandsEngine.{Coordinate, Island}
  
  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  def new(island_type, top_row, left_col) do
   coordinates = generate_coordinates(island_type, top_row, left_col)

   %Island{coordinates: MapSet.new(coordinates), hit_coordinates: MapSet.new()}
  end
  defp generate_coordinates(:dot, row, col) do
    [elem(Coordinate.new(row, col), 1)]
  end
  defp generate_coordinates(:square, top_row, left_col) do
    [{top_row, left_col}, {top_row, left_col + 1}, {top_row + 1, left_col}, {top_row + 1, left_col + 1}]
    |>  Enum.map(fn({row, col}) -> elem(Coordinate.new(row, col), 1) end)
  end
end
