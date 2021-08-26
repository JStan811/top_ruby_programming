# frozen_string_literal: true

# Represents the board object
class Board
  BLANK_BOARD =
    "     ______ ______ ______
    |      |      |      |
   A|      |      |      |
    |______|______|______|
    |      |      |      |
   B|      |      |      |
    |______|______|______|
    |      |      |      |
   C|      |      |      |
    |______|______|______|
       1      2      3
  "
  def show_blank_board
    BLANK_BOARD
  end
end

my_board = Board.new

puts my_board.show_blank_board
