# frozen_string_literal: true

require_relative 'classes'

my_board = Board.new
my_game = Game.new('new')

puts my_game.welcome_message

puts my_board.board_look

my_board.show_board

user_input = gets
