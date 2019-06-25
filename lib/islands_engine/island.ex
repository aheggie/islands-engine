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
    |>  Enum.map(fn({row_offset, col_offset}) -> Coordinate.new(top_row + row_offset, left_col + col_offset) end)
  end
  defp offsets(:atoll), do: [{0,0},{0,1},{1,1},{2,0},{2,1}]
  defp offsets(:dot), do: [{0,0}]
  defp offsets(:l_shape), do: [{0,0},{1,0},{2,0},{2,1}]
  defp offsets(:s_shape), do: [{0,1},{0,2},{1,0},{1,1}]
  defp offsets(:square), do: [{0,0},{0,1},{1,0},{1,1}]
end
