#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
class TimeComplexity
  
  # time complexity O(n2).
  def algorithm1(n)
    puts 'O(n2)'
    result = 0
    i = 0
    while i < n
      j = 0
      while j < i+1
        result += 1
        j+=1
      end
      i+=1
    end
    result
  end

  # time complexity O(n).
  def algorithm2(n)
    puts 'O(n)'
    result = 0
    i = 0
    while i < n
     result += (i + 1)
     i+=1
    end
    result
  end

  # time complexity O(1).
  def algorithm3(n)
    puts 'O(1)'
    n * (n + 1) / 2
  end

  # Tape equilibrium test
  # Info:
  # A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
  # Any integer P, such that 0 < P < N, splits this tape into two non−empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
  # The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
  # In other words, it is the absolute difference between the sum of the first part and the sum of the second part
  # For example, consider array A such that:
  #
  #   A[0] = 3
  #   A[1] = 1
  #   A[2] = 2
  #   A[3] = 4
  #   A[4] = 3
  #
  # We can split this tape in four places:
  #
  #   P = 1, difference = |3 − 10| = 7 
  #   P = 2, difference = |4 − 9| = 5 
  #   P = 3, difference = |6 − 7| = 1 
  #   P = 4, difference = |10 − 3| = 7 
  # 
  # Function that returns the minimal difference that can be achieved.
  #
  # For example, given:
  #   A[0] = 3
  #   A[1] = 1
  #   A[2] = 2
  #   A[3] = 4
  #   A[4] = 3
  # the function should return 1, as explained above.
  #
  # Assume that:
  #   N is an integer within the range [2..100,000];
  #   each element of array A is an integer within the range [−1,000..1,000].
  # Complexity:
  #   expected worst-case time complexity is O(N);
  #   expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
  #
  # @param a [Array] A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
  def tape_equilibrium(a)
    puts "tape_equilibrium: "
    return 0 if a.empty?
    # Example data: N=5, P(1-4), A[3,1,2,4,3]
    # P1:
    # [3] - [1,2,4,3]
    # [3,1] - [2,4,3]
    # [3,1,2] - [4,3]
    # [3,1,2,4] - [3]
    sum = a.inject(:+)
    left = a[0]
    right = sum - left
    min_diff = (right - left).abs
    for i in 1..(a.size-2) # -2 because the last iteration is the same as the first.
      left+= a[i]
      right-= a[i]
      diff = (right - left).abs
      min_diff = [min_diff, diff].min
    end
    min_diff
  end
  
  # A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get 
  # to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
  # Count the minimal number of jumps that the small frog must perform to reach its target.
  # Write a function:
  #
  #   def solution(x, y, d)
  #
  # that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
  #
  # For example, given:
  #   X = 10
  #   Y = 85
  #   D = 30
  #
  # the function should return 3, because the frog will be positioned as follows:
  # after the first jump, at position 10 + 30 = 40
  # after the second jump, at position 10 + 30 + 30 = 70
  # after the third jump, at position 10 + 30 + 30 + 30 = 100
  #
  # Assume that:
  #   X, Y and D are integers within the range [1..1,000,000,000];
  #   X ≤ Y.
  # Complexity:
  #   expected worst-case time complexity is O(1);
  #   expected worst-case space complexity is O(1).  
  #
  # @param x [Integer] start position.
  # @param y [Integer] goal position.
  # @param d [Integer] jump position.
  # @return [Integer] minimal number of jumps that the small frog must perform to reach its target.
  def frog_jmp(x, y, d)
    puts "frog_jmp: "
    (y-x).fdiv(d).ceil
  end
  
end

test = TimeComplexity.new
puts test.algorithm1 10
puts test.algorithm2 10
puts test.algorithm3 10
puts test.tape_equilibrium [3,1,2,4,3]
puts test.frog_jmp 10,85,30