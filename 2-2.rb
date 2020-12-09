# Each policy actually describes two positions in the password, where 1 means the first character, 2
# means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of
# "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of
# the letter are irrelevant for the purposes of policy enforcement.

# Given the same example list from above:

# 1-3 a: abcde is valid: position 1 contains a and position 3 does not.
# 1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
# 2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.

input = File.read('2-1.txt')
passwords = input.split("\n")

regex = /(\d+)-(\d+)\s([a-z]):\s(\w+)/

passwords.select do |string|
  (_, p1, p2, letter, pass) = regex.match(string).to_a
  (pass[p1.to_i - 1] == letter) ^ (pass[p2.to_i - 1] == letter)
end.count
