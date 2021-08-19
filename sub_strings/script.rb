# Notes:
#   Methods to use:
#     - String#include?

def substrings (string, array)
  string_a = string.downcase.split(" ")
  results = Hash.new(0)

  array.each do |element|
    string_a.each do |word|
      if word.include? element
        results[element] += 1
      else
        next
      end
    end
  end

  puts results

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("belowlow", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)