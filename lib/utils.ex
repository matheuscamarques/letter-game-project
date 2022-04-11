defmodule Letter.Utils do
  def input_prepare(input) do
    input
    |> String.trim()
    |> String.upcase()
    |> to_charlist
  end

  def exists?(_, []) do
    false
  end

  def exists?(elemento, [a | _]) when elemento == a do
    true
  end

  def exists?(elemento, [a | b]) when elemento != a do
    exists?(elemento, b)
  end

  def exist_positions(elemento, conjunto) do
    exist_positions(elemento, conjunto, 0, [])
  end

  def exist_positions(_, [], _, c) do
    c
  end

  def exist_positions(elemento, [a | b], index, c) when elemento == [a] do
    exist_positions(elemento, b, index + 1, c ++ [index])
  end

  def exist_positions(elemento, [a | b], index, c) when elemento != [a] do
    exist_positions(elemento, b, index + 1, c)
  end
end
