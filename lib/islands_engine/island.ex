defmodule IslandsEngine.Island do
  alias IslandsEngine.{Coordinate, Island}
  
  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  def new(island_type, top_row, left_col) do
   coordinates = generate_coordinates(island_type, top_row, left_col)

   %Island{coordinates: MapSet.new(coordinates), hit_coordinates: MapSet.new()}
  end
  defp generate_coordinates(island_type, top_row, left_col) do
    offsets(island_type)
    |>  Enum.map(fn({row_offset, col_offset}) -> elem(Coordinate.new(top_row + row_offset, left_col + col_offset), 1) end)
  end
  defp offsets(:square), do: [{0,0},{0,1},{1,0},{1,1}]
  defp offsets(:dot), do: [{0,0}]
end
