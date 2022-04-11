defmodule UtilsTest do
  use ExUnit.Case
  alias Letter.Utils

  describe "INPUT PREPARE" do
    assert Utils.input_prepare("\n   a   \n") == 'A'
  end

  describe "EXIST" do
    assert Utils.exists?("A", ["A", "B", "C"]) == true
    assert Utils.exists?("D", ["A", "B", "C"]) == false
  end

  describe "EXIST POSITIONS" do
    assert Utils.exist_positions('A', 'ABC') == [0]
    assert Utils.exist_positions('B', 'ABC') == [1]
    assert Utils.exist_positions('C', 'ABC') == [2]
    assert Utils.exist_positions('D', 'ABC') == []
  end
end
