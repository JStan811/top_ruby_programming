# frozen_string_literal: true

# game board object. Trying to figure out OOP, and this seems like a good thing to use as an object?
class Board
  attr_accessor :state

  def initialize
    @state = { A1: nil, A2: nil, A3: nil, B1: nil, B2: nil, B3: nil, C1: nil, C2: nil, C3: nil }
    @row_wins = [{ A1: 1, A2: 1, A3: 1 }, { B1: 1, B2: 1, B3: 1 }, { C1: 1, C2: 1, C3: 1 }]
    @column_wins = [{ A1: 1, B1: 1, C1: 1 }, { A2: 1, B2: 1, C2: 1 }, { A3: 1, B3: 1, C3: 1 }]
    @diagonal_wins = [{ A1: 1, B2: 1, C3: 1 }, { A3: 1, B2: 1, C1: 1 }]
  end

  # Win conditions as coordinates
  # row_win_conditions_coordinates = [[1, 3], [2, 3], [3, 3]], [[1, 2], [2, 2], [3, 2]], [[1, 1], [2, 1], [3, 1]]
  # column_win_conditions_coordinates = [[1, 1], [1, 2], [1, 3]], [[2, 1], [2, 2], [2, 3]], [[3, 1], [3, 2], [3, 3]]
  # diagonal_win_conditions_coordinates = [[1, 3], [2, 2], [3, 1]], [[1, 1], [2, 2], [3, 3]]

  def user_play(position, symbol)
    position = position.to_sym
    @state[position] = symbol
  end

  def win?(board_state)
    rows = win_per_type?(@row_wins, board_state)
    columns = win_per_type?(@column_wins, board_state)
    diagonals = win_per_type?(@diagonal_wins, board_state)

    rows || columns || diagonals
  end

  private

  def win_per_type?(type, board_state)
    answer = false

    type.each do |hash|
      if (hash.to_a - board_state.to_a).empty?
        answer = true
        break
      end
    end
    answer
  end
end
