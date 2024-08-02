for i in range(1, 6):
    print(i)

numbers = [1, 5, 9, 15, 21, 23]
new_numbers = [n * 2 for n in numbers]
print(new_numbers)
numbers_2 = [num**3 if num % 2 != 0 else "even" for num in range(1, 10)]
print(numbers_2)

raise_power_of_two = lambda x: x**2
print(raise_power_of_two(4))
print((lambda x: x / 2)(11))
sum_xy = lambda x, y: x + y(x)
print(sum_xy(3, lambda x: x**2))
