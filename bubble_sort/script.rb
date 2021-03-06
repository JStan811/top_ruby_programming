# frozen_string_literal: true

def bubble_sort(array)
  swap_counter = 0
  sorted_counter = 0

  while sorted_counter < 1
    array.each_with_index do |e, i|
      element_to_the_right = array[i + 1]
      if e == array.last
        break
      elsif e > element_to_the_right
        array[i + 1] = e
        array[i] = element_to_the_right
        swap_counter += 1
      end
    end
    sorted_counter = 1 if swap_counter.zero?
    swap_counter = 0
  end

  p array
  array
end

bubble_sort([4, 3, 78, 2, 0, 2])
