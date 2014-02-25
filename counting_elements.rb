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

  # A non-empty zero-indexed array A consisting of N integers is given.
  # A permutation is a sequence containing each element from 1 to N once, and only once.
  #
  # For example, array A such that:
  #     A[0] = 4
  #     A[1] = 1
  #     A[2] = 3
  #     A[3] = 2
  # is a permutation, but array A such that:
  #     A[0] = 4
  #     A[1] = 1
  #     A[2] = 3
  # is not a permutation.
  #
  # The goal is to check whether array A is a permutation.
  # Write a function:
  #
  #   def solution(a)
  #
  # that, given a zero-indexed array A, returns 1 if array A is a permutation and 0 if it is not.
  # For example, given array A such that:
  #     A[0] = 4
  #     A[1] = 1
  #     A[2] = 3
  #     A[3] = 2
  # the function should return 1.
  # Given array A such that:
  #     A[0] = 4
  #     A[1] = 1
  #     A[2] = 3
  # the function should return 0.
  #
  # Assume that:
  #   N is an integer within the range [1..100,000];
  #   each element of array A is an integer within the range [1..1,000,000,000].
  # Complexity:
  #   expected worst-case time complexity is O(N);
  #   expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
  #
  # @return [Integer] 1 if the array is a permutation, 0 if it is not.
  def perm_check(a)
    puts 'perm_check'
    n = a.size            # Get array a size
    count = [0] * n       # Create an array of size n filled with 0s (zeros).
    for i in 0..(a.size-1)
      v = a[i]
      if v <= a.size
        count[v-1]+=1
      else
        return 0
      end
    end
    for i in 0..(count.size-1)
      return 0 if count[i] != 1
    end
    1
  end
  # Ruby has the sort method so it is easy to use this method to solve the problem.
  def perm_check_with_sort(a)
    puts 'perm_check'
    a.sort!
    for i in 0..(a.size-1)
      return 0 if a[i] != i+1
    end
    1
  end



end

test = CountingElements.new
puts test.algorithm([0,0,4,2,4,5], 5).to_s
puts test.perm_check [1]
puts test.perm_check [2]
puts test.perm_check [4,1,3,2]
puts test.perm_check [4,1,3,2]
puts test.perm_check_with_sort []
