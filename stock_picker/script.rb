# frozen_string_literal: true

def stock_picker(prices)
  largest_profits = Array.new(0) # {Array.new()}
  prices.each_with_index do |price_outer, day_outer|
    profits = Array.new { Array.new }
    prices.each_with_index do |price_inner, day_inner|
      profits.push([day_outer, day_inner, price_inner - price_outer]) unless day_inner <= day_outer
    end
    sorted_profits = profits.compact.sort_by { |k| k[2] }
    largest_profits.push(sorted_profits.last)
  end
  sorted_largest_profits = largest_profits.compact.sort_by { |k| k[2] }
  best_day = sorted_largest_profits.last
  puts "Here's what you're gonna do: Buy on day #{best_day[0]} and sell on day #{best_day[1]} for a profit of $#{best_day[2]}."
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
