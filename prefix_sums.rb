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

end

test = PrefixSums.new
puts test.prefix([0,1,2,3,4,5]).to_s
puts test.suffix([0,1,2,3,4,5]).to_s