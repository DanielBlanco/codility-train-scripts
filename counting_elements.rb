#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
class CountingElements

  # Problem: You are given an integer m such that (1 <= m <= 1000000) and a non-empty,
  # zero-indexed array A of n integers: a0, a1, ..., an−1 such that (0 <= ai <= m).
  # Count the number of occurrences of the values 0, 1, ..., m.
  #
  # time complexity O(n + m).
  def algorithm(a, m)
    puts 'O(n + m)'
    n = a.size            # Get array a size
    count = [0] * (m+1)   # Create an array of size m+1 filled with 0s (zeros).
    for k in 0..(n-1)
      count[a[k]]+=1      # Count each number of a
    end
    count
  end

end

test = CountingElements.new
puts test.algorithm([0,0,4,2,4,5], 5).to_s
