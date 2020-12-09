# For example, suppose you have the following list:

# 1-3 a: abcde
# 1-3 b: cdefg
# 2-9 c: ccccccccc
# Each line gives the password policy and then the password. The password policy indicates the lowest
# and highest number of times a given letter must appear for the password to be valid. For example,
# 1-3 a means that the password must contain a at least 1 time and at most 3 times.

# How many passwords are valid according to their policies?
# Input: https://adventofcode.com/2020/day/2/input (copy content in input variable)

input = File.read('2-1.txt')
passwords = input.split("\n")

regex = /(\d+)-(\d+)\s([a-z]):\s(\w+)/

passwords.select do |string|
  (_, min, max, letter, pass) = regex.match(string).to_a
  puts string unless pass
  (min.to_i..max.to_i).include?(pass.count(letter))
end.count
