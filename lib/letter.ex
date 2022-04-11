defmodule Letter do
  alias Letter.Utils

  @wrong '-'
  @wrong_position '*'

  def compare(input, palavra) do
    compare(input, palavra, [], palavra)
  end

  defp compare([], [], saida, _) do
    saida |> to_string()
  end

  defp compare([a | b], [c | d], saida, palavra) when a == c do
    compare(b, d, saida ++ [a], palavra)
  end

  defp compare([a | b], [c | d], saida, palavra) when a != c do
    case Utils.exists?(a, palavra) do
      true ->
        compare(b, d, saida ++ [@wrong_position], palavra)

      false ->
        compare(b, d, saida ++ [@wrong], palavra)
    end
  end
end
