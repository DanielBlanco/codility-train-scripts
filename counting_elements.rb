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
    puts 'perm_check_with_sort'
    a.sort!
    for i in 0..(a.size-1)
      return 0 if a[i] != i+1
    end
    1
  end

  # A small frog wants to get to the other side of a river. The frog is currently located at position 0, and wants to get to position X.
  # Leaves fall from a tree onto the surface of the river.
  # You are given a non-empty zero-indexed array A consisting of N integers representing the falling leaves.
  # A[K] represents the position where one leaf falls at time K, measured in minutes.
  # The goal is to find the earliest time when the frog can jump to the other side of the river.
  # The frog can cross only when leaves appear at every position across the river from 1 to X.
  # For example, you are given integer X = 5 and array A such that:
  #
  #   A[0] = 1
  #   A[1] = 3
  #   A[2] = 1
  #   A[3] = 4
  #   A[4] = 2
  #   A[5] = 3
  #   A[6] = 5
  #   A[7] = 4
  #
  # In minute 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
  # Write a function:
  #
  #   int solution(x, a)
  #
  # that, given a non-empty zero-indexed array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
  # If the frog is never able to jump to the other side of the river, the function should return −1.
  # For example, given X = 5 and array A such that:
  #
  #   A[0] = 1
  #   A[1] = 3
  #   A[2] = 1
  #   A[3] = 4
  #   A[4] = 2
  #   A[5] = 3
  #   A[6] = 5
  #   A[7] = 4
  #
  # the function should return 6, as explained above. Assume that:
  #   N and X are integers within the range [1..100,000];
  #   each element of array A is an integer within the range [1..X].
  # Complexity:
  #   expected worst-case time complexity is O(N);
  #   expected worst-case space complexity is O(X), beyond input storage (not counting the storage required for input arguments).
  #
  # NOTE: I am sure there is a better way to do it, but for now this algorightm scores 100.
  #
  # @param x [Integer] the position the frog wants to reach.
  # @param a [Array<Integer>] Leafs positions and times.
  # @return [Integer] -1 if not able to get to the other side.
  def frog_river_one(x, a)
    puts 'frog_river_one'
    return -1 if a.empty? || x > a.size+1
    n = a.size                      # Get array a size
    leafs = [-1] * n                # Create an array of size n filled with -1s.
    for i in 0..(n-1)
      k = a[i]-1
      leafs[k]=i if leafs[k] < 0    # This will create an array of times using index as position: [0, 4, 1, 3, 6, -1, -1, -1]
    end
    return -1 if leafs.size < x
    time = 0
    for i in 0..(x-1)
      return -1 if leafs[i] < 0
      time = leafs[i] if time < leafs[i]
    end
    time
  end


  # You are given N counters, initially set to 0, and you have two possible operations on them:
  #
  #   increase(X) − counter X is increased by 1,
  #   max_counter − all counters are set to the maximum value of any counter.
  #
  # A non-empty zero-indexed array A of M integers is given. This array represents consecutive operations:
  #
  #   if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
  #   if A[K] = N + 1 then operation K is max_counter.
  #
  # For example, given integer N = 5 and array A such that:
  #
  #     A[0] = 3
  #     A[1] = 4
  #     A[2] = 4
  #     A[3] = 6
  #     A[4] = 1
  #     A[5] = 4
  #     A[6] = 4
  #
  # the values of the counters after each consecutive operation will be:
  #
  #     (0, 0, 1, 0, 0)
  #     (0, 0, 1, 1, 0)
  #     (0, 0, 1, 2, 0)
  #     (2, 2, 2, 2, 2)
  #     (3, 2, 2, 2, 2)
  #     (3, 2, 2, 3, 2)
  #     (3, 2, 2, 4, 2)
  #
  # The goal is to calculate the value of every counter after all operations.
  # Write a function:
  #
  #   solution(n, a)
  #
  # that, given an integer N and a non-empty zero-indexed array A consisting of M integers,
  # returns a sequence of integers representing the values of the counters.
  # The sequence should be returned as:
  #
  #   a structure Results (in C), or
  #   a vector of integers (in C++), or
  #   a record Results (in Pascal), or
  #   an array of integers (in any other programming language) (BINGO: THIS IS RUBY!).
  #
  # For example, given:
  #
  #     A[0] = 3
  #     A[1] = 4
  #     A[2] = 4
  #     A[3] = 6
  #     A[4] = 1
  #     A[5] = 4
  #     A[6] = 4
  #
  # the function should return [3, 2, 2, 4, 2], as explained above.
  # Assume that:
  #   N and M are integers within the range [1..100,000];
  #   each element of array A is an integer within the range [1..N + 1].
  # Complexity:
  #   expected worst-case time complexity is O(N+M);
  #   expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
  #
  # Example crital clear explanation:
  #
  # a => [3, 4, 4, 6, 1, 4, 4]
  # n => 5 which represents (0, 0, 0, 0, 0)
  #
  # The iteration goes like this:
  #
  # 1st iteration:
  # a[0] != N1 and a[0] != 5+1
  # a[0] != N2 and a[0] != 5+1
  # a[0] == N3 and a[0] != 5+1 then increase N3 by 1
  # a[0] != N4 and a[0] != 5+1
  # a[0] != N5 and a[0] != 5+1
  # (0, 0, 1, 0, 0)
  #
  # 2nd iteration:
  # a[1] != N1 and a[1] != 5+1
  # a[1] != N2 and a[1] != 5+1
  # a[1] != N3 and a[1] != 5+1
  # a[1] == N4 and a[1] != 5+1 then increase N4 by 1
  # a[1] != N5 and a[1] != 5+1
  # (0, 0, 1, 1, 0)
  #
  # 3th iteration:
  # a[2] != N1 and a[2] != 5+1
  # a[2] != N2 and a[2] != 5+1
  # a[2] != N3 and a[2] != 5+1
  # a[2] == N4 and a[2] != 5+1 then increase N4 by 1
  # a[2] != N5 and a[2] != 5+1
  # (0, 0, 1, 2, 0)
  #
  # 4th iteration:
  # a[3] != N1 and a[3] == 5+1 then set ALL to max counter
  # (2, 2, 2, 2, 2)
  #
  # 5th iteration:
  # a[4] == N1 and a[4] != 5+1 then increase N1 by 1
  # (3, 2, 2, 2, 2)
  #
  # 6th iteration:
  # a[5] != N1 and a[5] != 5+1
  # a[5] != N2 and a[5] != 5+1
  # a[5] != N3 and a[5] != 5+1
  # a[5] == N4 and a[5] != 5+1 then increase N4 by 1
  # a[5] != N5 and a[5] != 5+1
  # (3, 2, 2, 3, 2)
  #
  # 7th iteration:
  # a[6] != N1 and a[6] != 5+1
  # a[6] != N2 and a[6] != 5+1
  # a[6] != N3 and a[6] != 5+1
  # a[6] == N4 and a[6] != 5+1 then increase N4 by 1
  # a[6] != N5 and a[6] != 5+1
  # (3, 2, 2, 4, 2)
  #
  # @param n [Integer] number of counters.
  # @param a [Array[Integer]] array of operations.
  def max_counters(n, a)
    puts 'max_counters'
    # O(N+M) are 2 loops (not nested).
    counters = [0] * n      # Create an array of size n filled with 0s (zeros).
    max = 0
    latest_max = 0
    for i in 0..(a.size-1)
      if a[i] == n+1
        latest_max = max
      else
        j = a[i]-1
        if counters[j] < latest_max
          counters[j] = latest_max+1
        else
          counters[j]+=1
        end
        max = counters[j] if counters[j] > max
      end
    end
    for i in 0..(counters.size-1)
      counters[i] = latest_max if counters[i] < latest_max
    end
    counters
  end

end

test = CountingElements.new
puts test.algorithm([0,0,4,2,4,5], 5).to_s
puts test.perm_check [4,1,3,2]
puts test.perm_check_with_sort [4,1,3,2]
puts test.frog_river_one(5, [1,3,1,4,2,3,5,4])   # 6
puts test.frog_river_one(7, [1,3,1,4,2,3,5,4,7]) # -1
puts test.frog_river_one(1, [1,3,1,4,2,3,5,4,7]) # 0
puts test.frog_river_one(1, [1]) # 0
puts test.frog_river_one(2, [1]) # -1
puts test.frog_river_one(3, [1,2,4,5,6,1,3]) # 6
puts test.frog_river_one(3, [1,4,5,6,1,3,1,4,6,2,1,3]) # 9
puts test.max_counters(5, [3,4,4,6,1,4,4]).to_s
