#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
class FizzBuzz

  # Problem: Write a program that prints the numbers from 1 to 100. But for
  # multiples of three print “Fizz” instead of the number and for the multiples
  # of five print “Buzz”. For numbers which are multiples of both three and five
  # print “FizzBuzz”
  def algorithm
    (1..100).each do |num|
      message = ""
      message << "Fizz" if num%3 == 0
      message << "Buzz" if num%5 == 0
      message << num.to_s if message.empty?
      puts message
    end
  end

end

test = FizzBuzz.new
test.algorithm
