# frozen_string_literal: true

# I'm stuck between Game and GameMaster for this. Using a top down approach, this seems like the "top"?
class Game
  def play_game(player1, player2, player1_board, player2_board, game_board)
    puts welcome_message

    loop do
      turn(player1, player1_board, game_board)
      if player1_board.win?
        puts "#{player1.name}, you win!"
        break
      end
      if game_board.tie?
        puts 'Game tie!'
        break
      end

      turn(player2, player2_board, game_board)
      if player2_board.win?
        puts "#{player2.name}, you win!"
        break
      end
      if game_board.tie?
        puts 'Game tie!'
        break
      end
    end
  end

  private

  def welcome_message
    puts 'Tic Tac Toe'
    puts ''
    puts "Player 1, you control the X's. Player 2, you control the Y's."
    puts ''
  end

  def turn(player, player_board, game_board)
    symbol = player.name == 'Player 1' ? 'X' : 'O'

    puts "#{player.name}, make your play:"
    puts ''
    user_input = gets.chomp
    player_board.user_play(user_input, 1)
    game_board.user_play(user_input, symbol)
    game_board.display_board
  end
end
