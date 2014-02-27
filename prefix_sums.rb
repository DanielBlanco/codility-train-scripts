#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
class PrefixSums

  # Prefix sums provide a simple yet powerful technique that allows for the fast calculation of sums of elements
  # in given contiguous segments of arrays. Prefix sums are defined as the consecutive totals of the
  # first 0, 1, 2, . . . , n elements of an array.
  #
  #   [    a0,  a1,    a2,      a3,        a4,          a5] <= Array
  #   ( 0,0+0, 0+1, 0+1+2, 0+1+2+3, 0+1+2+3+4, 0+1+2+3+4+5) <= Sum
  #   (p0, p1,  p2,    p3,      p4,        p5,          p6) <= P index
  #   ( 0,  0,   1,     3,       6,        10,          15) <= P result
  #
  # We can easily calculate the prefix sums in O(n) time complexity.
  # Notice that the total pk equals pk−1 + ak−1, so each consecutive value can be calculated in a constant time.
  #
  # @param a [Array<Integer>] of consecutive numbers.
  def prefix(a)
    n = a.size
    p = [0] * (n+1)
    for k in 1..n
      p[k] = p[k-1] + a[k-1]
    end
    p
  end

  # Similarly, we can calculate suffix sums, which are the totals of the k last values.
  #
  #   [    a0,  a1,    a2,       a3,        a4,          a5]
  #   ( 0,0+5, 5+4, 5+4+3, 5+4+3+2, 5+4+3+2+1, 5+4+3+2+1+0)
  #   (p0, p1, p2,    p3,      p4,        p5,          p6) <= P index
  #   ( 0,  5,  9,    12,      14,        15,          15) <= P result
  #
  # @param a [Array<Integer>] of consecutive numbers.
  def suffix(a)
    n = a.size
    p = [0] * (n+1)
    for k in 1..n
      p[k] = p[k-1] + a[n-k]
    end
    p
  end

  # Problem: You are given a non-empty, zero-indexed array A of n integers: a0,a1,...,an−1
  # such that(0 <= ai <= 1000),and integers k and m such that 0 <= k, m < n </100000.
  # A robot is at position k in array A and should perform m moves.
  # One move moves a robot to an adjacent cell of the array. In every cell, the robot collects the value in the cell
  # and replaces it with 0. The sum is the total of all collected values, and the goal is to calculate the maximum
  # sum that the robot can collect in m moves.
  #
  # For example, consider array A such that:
  #
  #   [2, 3, 1, 5, 1, 3, 9] <= Array values
  #   (0, 1, 2, 3, 4, 5, 6) <= Array indexes
  #
  # The robot starts at position k = 4 and should perform m = 4 moves.
  # The robot might move to cells (3,4,5,6) and thereby collect the values 1 + 5 + 0 + 3 + 9 = 18.
  # This is the maximal sum that the robot can collect.
  #
  # Solution: Note that the best option is to move in one direction optionally followed by some moves in the opposite direction.
  # The robot should not change direction more than once. With this observation you can find the simplest solution.
  # Make the first p = 0,1,2,...,m moves in one direction, then the next m − p moves in the opposite direction.
  # This is just a simple simulation of the moves of the robot, and requires O(n * m) time.
  #
  # A better approach is to use prefix sums. If we make p moves in one direction, we can calculate
  # the maximal opposite location of the robot. The robot collects all values between these extremes.
  # We can calculate the total collected values in constant time by using prefix sums,
  # and the total time complexity, at such a solution is O(n + m).
  #
  # @param a [Array<Integer>] of numbers (0 - 1000).
  # @param a [Integer] robot start position.
  # @param m [Integer] number of movements.
  def exercise(a, k, m)
    puts 'exercise'
    n = a.size
    p = [0] * (n+1)
    for i in 1..n
      p[i] = p[i-1] + a[i-1]
    end
    # TODO: Think about this one.
    v1 = (k-m) >= 0 ? p[k-m] : 0 # ONLY movements to the left.
    v2 = (m-k) >= 0 ? p[k-m] : 0 # ONLY movements to the left.
    puts p.to_s
    l = p[k+1]
    puts l
    r = p[] - p[k-1]
    puts r
  end

end

test = PrefixSums.new
puts test.prefix([0,1,2,3,4,5]).to_s
puts test.suffix([0,1,2,3,4,5]).to_s
puts test.exercise([2, 3, 1, 5, 1, 3, 9], 4, 4).to_s