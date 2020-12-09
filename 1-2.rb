# Find three numbers in your expense report that meet the same criteria.

input = File.read('1.txt')

expenses = input.split("\n").map(&:to_i).sort
count = expenses.count

done = false
i3 = count / 2

until done
  n3 = expenses[i3]
  i1 = 0
  i2 = count - 1

  (0..count).each do |_i|
    n1 = expenses[i1]; n2 = expenses[i2]
    sum = n1 + n2 + n3

    if sum == 2020
      done = true
      break puts [n1, n2, n3]
    end

    if i1 == i2
      i3 += 1 if i1 > i3
      i3 -= 1 if i1 < i3
      break
    end

    i1 += 1 if sum < 2020
    i2 -= 1 if sum > 2020
  end
end
