import signal
import time
from functools import wraps


def print_before_and_after(func):
    def wrapper(*args):
        print("Before {}".format(func.__name__))
        # Call the function being decorated with *args
        func(*args)
        print("After {}".format(func.__name__))

    # Return the nested function
    return wrapper


@print_before_and_after
def multiply(a, b):
    print(a * b)


multiply(5, 10)


def memoize(func):
    """Store the results of the decorated function for fast lookup"""
    # Store results in a dict that maps arguments to results
    cache = {}

    # Define the wrapper function to return
    def wrapper(*args, **kwargs):
        kwargs_key = tuple(sorted(kwargs.items()))
        # Use a tuple of args and sorted kwargs for cache key
        cache_key = (args, kwargs_key)
        if cache_key not in cache:
            # Call func() and store results in cache
            cache[cache_key] = func(*args, **kwargs)
        return cache[cache_key]

    return wrapper


@memoize
def slow_function(a, b):
    print("Sleeping...")
    time.sleep(3)
    return a + b


print(slow_function(2, 3))
print(slow_function(2, 3))


def add_hello(func):
    # Decorate wrapper() so that it keeps func()'s metadata
    @wraps(func)
    def wrapper(*args, **kwargs):
        """Print 'hello' and then call the decorated function."""
        print("Hello")
        return func(*args, **kwargs)

    return wrapper


@add_hello
def print_sum(a, b):
    """Adds two numbers and prints the sum"""
    print(a + b)


print_sum(10, 20)
print_sum_docstring = print_sum.__doc__
print(print_sum_docstring)


@check_everything
def duplicate(my_list):
    """Return a new list that repeats the input twice"""
    return my_list + my_list


t_start = time.time()
duplicated_list = duplicate(list(range(50)))
t_end = time.time()
decorated_time = t_end - t_start

t_start = time.time()
# Call the original function instead of the decorated one
duplicated_list = duplicate.__wrapped__(list(range(50)))
t_end = time.time()
undecorated_time = t_end - t_start

print("Decorated time: {:.5f}s".format(decorated_time))
print("Undecorated time: {:.5f}s".format(undecorated_time))


def run_n_times(n):
    """Define and return a decorator"""

    def decorator(func):
        def wrapper(*args, **kwargs):
            for i in range(n):
                func(*args, **kwargs)

        return wrapper

    return decorator


# Use run_n_times() to create the run_five_times() decorator
run_five_times = run_n_times(5)


@run_five_times
def print_sum(a, b):
    print(a + b)


print_sum(4, 100)


def html(open_tag, close_tag):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            msg = func(*args, **kwargs)
            return "{}{}{}".format(open_tag, msg, close_tag)

        # Return the decorated function
        return wrapper

    # Return the decorator
    return decorator


# Wrap the result of hello_goodbye() in <div> and </div>
html("<div>", "</div>")


def hello_goodbye(name):
    return "\n{}\n{}\n".format(hello(name), goodbye(name))


print(hello_goodbye("Alice"))


def timeout(n_seconds):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            # Set an alarm for n seconds
            signal.alarm(n_seconds)
            try:
                # Call the decorated function
                return func(*args, **kwargs)
            finally:
                # Cancel the alarm
                signal.alarm(0)
            return wrapper

        return decorator
