# frozen_string_literal: true

# game board object. Trying to figure out OOP, and this seems like a good thing to use as an object?
class Board
  attr_accessor :state

  def initialize
    @state = { A1: ' ', A2: ' ', A3: ' ', B1: ' ', B2: ' ', B3: ' ', C1: ' ', C2: ' ', C3: ' ' }
    @row_wins = [{ A1: 1, A2: 1, A3: 1 }, { B1: 1, B2: 1, B3: 1 }, { C1: 1, C2: 1, C3: 1 }]
    @column_wins = [{ A1: 1, B1: 1, C1: 1 }, { A2: 1, B2: 1, C2: 1 }, { A3: 1, B3: 1, C3: 1 }]
    @diagonal_wins = [{ A1: 1, B2: 1, C3: 1 }, { A3: 1, B2: 1, C1: 1 }]
  end

  # Win conditions as coordinates
  # row_win_conditions_coordinates = [[1, 3], [2, 3], [3, 3]], [[1, 2], [2, 2], [3, 2]], [[1, 1], [2, 1], [3, 1]]
  # column_win_conditions_coordinates = [[1, 1], [1, 2], [1, 3]], [[2, 1], [2, 2], [2, 3]], [[3, 1], [3, 2], [3, 3]]
  # diagonal_win_conditions_coordinates = [[1, 3], [2, 2], [3, 1]], [[1, 1], [2, 2], [3, 3]]

  def display_board()
    cell_hash = @state
    board =
    "      _______ _______ _______
     |       |       |       |
    A|   #{cell_hash[:A1]}   |   #{cell_hash[:A2]}   |   #{cell_hash[:A3]}   |
     |_______|_______|_______|
     |       |       |       |
    B|   #{cell_hash[:B1]}   |   #{cell_hash[:B2]}   |   #{cell_hash[:B3]}   |
     |_______|_______|_______|
     |       |       |       |
    C|   #{cell_hash[:C1]}   |   #{cell_hash[:C2]}   |   #{cell_hash[:C3]}   |
     |_______|_______|_______|
        1       2       3
    "
    puts board
  end

  def user_play(position, symbol)
    position = position.to_sym
    @state[position] = symbol
  end

  def win?
    rows = win_per_type?(@row_wins, state)
    columns = win_per_type?(@column_wins, state)
    diagonals = win_per_type?(@diagonal_wins, state)


    rows || columns || diagonals
  end

  def tie?
    !(state.value? ' ')
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
