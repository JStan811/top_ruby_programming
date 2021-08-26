# frozen_string_literal: true

# Ruby Programming Project: Caesar Cipher
# by: Jake Standley 08/19/2021

# Instructions:
# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

#   > caesar_cipher("What a string!", 5)
#   => "Bmfy f xywnsl!"
# Quick Tips:
# You will need to remember how to convert a string into a number.
# Don’t forget to wrap from z to a.
# Don’t forget to keep the same case.

# Notes:
# Methods to use: char#ord and int#chr

def caeser_cipher(string, shift_factor)
  char_arr = string.split('')

  char_arr.map! do |c|
    shifted = (c.ord + shift_factor)

    if !((c.ord >= 65 && c.ord <= 90) || (c.ord >= 97 && c.ord <= 122))
      c
    elsif (shifted > 90 && ((shifted) < 97)) || ((shifted) > 122)
      (shifted - 26).chr
    else
      shifted.chr
    end
  end

  puts char_arr.join
end

caeser_cipher('What a string!', 5)
