def create_math_function(func_name):
    if func_name == "add":

        def add(a, b):
            return a + b

        return add
    elif func_name == "subtract":
        # Define the subtract() function
        def subtract(a, b):
            return a - b

        return subtract
    else:
        print("I don't know that one")


add = create_math_function("add")
print("5 + 2 = {}".format(add(5, 2)))

subtract = create_math_function("subtract")
print("5 - 2 = {}".format(subtract(5, 2)))


def return_a_func(arg1, arg2):
    def new_func():
        print("arg1 was {}".format(arg1))
        print("arg2 was {}".format(arg2))

    return new_func


my_func = return_a_func(3, 5)
my_func()
# Show that my_func()'s closure is not None
print(my_func.__closure__ is not None)
print(len(my_func.__closure__) == 2)

# Get the values of the variables in the closure
closure_values = [my_func.__closure__[i].cell_contents for i in range(2)]
print(closure_values == [2, 17])


def my_special_function():
    print("You are running my_special_function()")


def get_new_func(func):
    def call_func():
        func()

    return call_func


# Overwrite `my_special_function` with the new function
my_special_function = get_new_func(my_special_function)

my_special_function()
