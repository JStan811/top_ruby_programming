# frozen_string_literal: true

# I'm stuck between Game and GameMaster for this. Using a top down approach, this seems like the "top"?
class Game
  def play_game(player1, player2, player1_board, player2_board, game_board)
    puts welcome_message

    loop do
      break if turn_win?(player1, player1_board, game_board) || turn_win?(player2, player2_board, game_board)
    end
  end

  private

  def welcome_message
    puts 'Tic Tac Toe'
    puts ''
    puts "Player 1, you control the X's. Player 2, you control the Y's."
    puts ''
  end

  def turn_win?(player, player_board, game_board)
    player_win = false

    puts "#{player.name}, make your play:"
    user_input = gets.chomp
    player_board.user_play(user_input, 1)
    game_board.user_play(user_input, 'X')
    puts "Game board: #{game_board.state}"

    if player_board.win?(player_board.state)
      puts "#{player.name}, you win!"; player_win = true
    end
    player_win
  end
end

# Original loop
# loop do
#   puts "#{player1.name}, make your play:"
#   user_input = gets.chomp
#   player1_board.user_play(user_input, 1)
#   puts "#{player1.name} board: #{player1_board.state}"
#   game_board.user_play(user_input, 'X')
#   puts "Game board: #{game_board.state}"
#   puts ''
#   if player1_board.win?(player1_board.state)
#     puts "#{player1.name}, you win!"
#     break
#   end

#   puts "#{player2.name}, make your play:"
#   user_input = gets.chomp
#   player2_board.user_play(user_input, 1)
#   puts "#{player2.name} board: #{player2_board.state}"
#   game_board.user_play(user_input, 'Y')
#   puts "Game board: #{game_board.state}"
#   puts ''
#   if player2_board.win?(player2_board.state)
#     puts "#{player2.name}, you win!"
#     break
#   end
# end
