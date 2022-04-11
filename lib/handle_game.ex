defmodule Letter.HandleGame do
  alias Letter.Game
  alias Letter.Utils

  def call() do
    game = Letter.Game.new()
    IO.puts("Digite sua tentativa: ")
    loop_game(game)
  end

  def loop_game(game = %Game{winner: true}) do
    Game.print(game)
    IO.puts("Você acertou a palavra!")
  end

  def loop_game(game = %Game{winner: false}) when game.lifes == 0 do
    Game.print(game)
    IO.puts("Você perdeu suas vidas acabaram!")
  end

  def loop_game(game) do
    Game.print(game)

    IO.gets("")
    |> Utils.input_prepare()
    |> handle_game(game)
    |> loop_game
  end

  def handle_game(input, game) when input == game.word do
    %Game{
      lifes: game.lifes,
      last_words: game.last_words ++ [input],
      winner: true,
      word: game.word
    }
  end

  def handle_game(input, game) do
    result = Letter.compare(input, game.word)

    %Game{
      lifes: game.lifes - 1,
      last_words: game.last_words ++ [result],
      winner: false,
      word: game.word
    }
  end
end
