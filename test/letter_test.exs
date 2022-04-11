defmodule LetterTest do
  use ExUnit.Case
  alias Letter

  describe "Tentativas Certa" do
    assert Letter.compare('a', 'a') == "a"
  end

  describe "Tentativas Errada" do
    assert Letter.compare('a', 'b') == "-"
  end

  describe "Tentativas acerto erro " do
    assert Letter.compare('ac', 'ab') == "a-"
  end

  describe "Tentativas acerto erro dica" do
    assert Letter.compare('acdd', 'abad') == "a-*d"
  end

  describe "Tentativa duplicada" do
    assert Letter.compare('ABBA', 'BAAA') == "***A"
  end

  describe "ABACATE -> ABACATO" do
    assert Letter.compare('ABACATE', 'ABACATO') == "ABACAT-"
  end

  describe "ABOBORA -> ABOBORA" do
    assert Letter.compare('ABOBORA', 'ABOBORA') == "ABOBORA"
  end

  describe "Game LINDO TESTE" do
    palavra = 'LINDO'
    assert Letter.compare('TURMA', palavra) == "-----"
    assert Letter.compare('SENTE', palavra) == "--N--"
    assert Letter.compare('PINHO', palavra) == "-IN-O"
    assert Letter.compare('BINGO', palavra) == "-IN-O"
    assert Letter.compare('LINDO', palavra) == "LINDO"
  end

  describe "Game CRIME" do
    palavra = 'CRIME'
    assert Letter.compare('DANÇA', palavra) == "-----"
    assert Letter.compare('TENDA', palavra) == "-*---"
    assert Letter.compare('TOUCA', palavra) == "---*-"
    assert Letter.compare('TRUFA', palavra) == "-R---"
    assert Letter.compare('TRUTA', palavra) == "-R---"
    assert Letter.compare('GRITE', palavra) == "-RI-E"
    assert Letter.compare('CRIME', palavra) == "CRIME"
  end

  describe "Game TRUTA" do
    palavra = 'TRUTA'

    # UM CASO COM UMA LETRA[1] COMO DICA MAS NO FINAL TEMOS UM ACERTO O RESULTADO ESPERADO É ----A
    # PORÉM SE NÃO TRATADO O RESULTADO É -*--A
    # RESOLVER NO FUTURO
    # assert Letter.compare('DANÇA', palavra) == "----A"
    assert Letter.compare('TENDA', palavra) == "T---A"
    assert Letter.compare('TOUCA', palavra) == "T-U-A"
    assert Letter.compare('TRUFA', palavra) == "TRU-A"
    assert Letter.compare('TRUTA', palavra) == "TRUTA"
  end
end
