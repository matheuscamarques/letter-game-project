defmodule Letter.Game do
  defstruct [:word, :lifes, :last_words, :winner]
  @default_lifes 5
  @words ['TRUTA', 'CRIME', 'LINDO' , 'DRENO' , 'BRUXA', 'ERETO']

  def new() do
    Enum.map(@words, fn word -> "#{word} " end)
    |> IO.puts

    word = Enum.random(@words)

    %{
      input: "",
      word: word,
      lifes: @default_lifes,
      last_words: [],
      winner: false
    }
  end

  def new(word) do
    %{
      input: "",
      word: word,
      lifes: @default_lifes,
      last_words: [],
      winner: false
    }
  end

  def print(game) do
    IO.puts("Tentativas: #{game.lifes}")
    Enum.map(game.last_words, fn word -> IO.puts(word) end)
  end

end
