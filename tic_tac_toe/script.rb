# frozen_string_literal: true

require_relative 'classes'

# making the necessary objects. 1 game board to display and separate player    # boards to make it easier to determine win and tie
my_game = Game.new('new')
game_board = Board.new
player1 = Player.new('Player 1')
player1_board = Board.new
player2 = Player.new('Player 2')
player2_board = Board.new

puts my_game.welcome_message

game_ongoing = true

while game_ongoing
  puts "#{player1.name}, make your play:"
  user_input = gets.chomp
  player1_board.user_play(user_input, 1)
  puts "#{player1.name} board: #{player1_board.state}"
  game_board.user_play(user_input, 'X')
  puts "Game board: #{game_board.state}"
  puts ''
  if player1_board.win?(player1_board.state)
    puts "#{player1.name}, you win!"
    break
  end

  puts "#{player2.name}, make your play:"
  user_input = gets.chomp
  player2_board.user_play(user_input, 1)
  puts "#{player2.name} board: #{player2_board.state}"
  game_board.user_play(user_input, 'Y')
  puts "Game board: #{game_board.state}"
  puts ''
  if player2_board.win?(player2_board.state)
    puts "#{player2.name}, you win!"
    break
  end
end

# This is how I think a turn will work
# 1. determine player
# 2. display board
# 3. get player input
# 4. update board
# 5. check for win or tie
#   a. if win, declare winner and exit
#   b. if tie, declare tie and exit
#   c. else, continue to next turn
