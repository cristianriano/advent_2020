# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces
# 1721 * 299 = 514579, so the correct answer is 514579.

input = File.read('1.txt')

expenses = input.split("\n").map(&:to_i).sort
count = expenses.count

i1 = 0
i2 = count - 1

(0..count).each do |_i|
  n1 = expenses[i1]; n2 = expenses[i2]
  sum = n1 + n2
  break [n1, n2] if sum == 2020

  i1 += 1 if sum < 2020
  i2 -= 1 if sum > 2020
end
