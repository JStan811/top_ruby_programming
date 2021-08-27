# frozen_string_literal: true

# I'm stuck between Game and GameMaster for this. Using a top down approach, this seems like the "top"?
class Game
  def initialize(state)
    @state = state # state is like win/loss/tie etc.
  end

  def give_score(player1_score, player2_score)
    "Player 1: #{player1_score} | Player 2: #{player2_score}"
  end

  def welcome_message
    puts 'Yo, you ready to play some Tic-Tac-Toe?'
    puts ''
    puts "Player 1, you control the X's. Player 2, you control the Y's."
    puts ''
    puts 'Player 1 make your play:'
  end
end

# game board object. Trying to figure out OOP, and this seems like a good thing to use as an object?
class Board
  attr_reader :state, :board_look

  @state = [{ A1: nil, A2: nil, A3: nil }, { B1: nil, B2: nil, B3: nil }, { C1: nil, C2: nil, C3: nil }]

  @board_look =
    "     _______ _______ _______
  |       |       |       |
 A|       |       |       |
  |_______|_______|_______|
  |       |       |       |
 B|       |       |       |
  |_______|_______|_______|
  |       |       |       |
 C|       |       |       |
  |_______|_______|_______|
     1      2      3
"

  def set_board(player1, player2)
    @state[0][player1] = 'X'
  end

  def show_board
    puts @board_look
  end

end
