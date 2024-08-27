import contextlib
import time


@contextlib.contextmanager
def database(url):
    # set up database connection
    db = postgres.connect(url)

    yield db

    # tear down database connection
    db.disconnect()


url = "http://localhost/database"
with database(url) as db:
    products = db.execute("SELECT * FROM products")


# Add a decorator that will make timer()  a context manager
@contextlib.contextmanager
def timer():
    """Time the execution of a context block.

    Yields:
        None
    """
    start = time.time()
    yield
    end = time.time()
    print(f"Execution time: {end - start} seconds")


with timer():
    print("This should take approximately 0.25 seconds")
    time.sleep(0.25)


@contextlib.contextmanager
def open_read_only(filename):
    """Open a file in read-only mode.

    Args:
      filename (str): The location of the file to read

    Yields:
      file object
    """
    read_only_file = open(filename, mode="r")
    # Yield read_only_file so it can be assigned to my_file
    yield read_only_file
    # Close read_only_file
    read_only_file.close()


with open_read_only("my_file.txt") as my_file:
    print(my_file.read())


# Use the "stock('NVDA')" context manager
# and assign the result to the variable "nvda"
with stock("NVDA") as nvda:
    # Open "NVDA.txt" for writing as f_out
    with open("NVDA.txt", "w") as f_out:
        for _ in range(10):
            value = nvda.price()
            print("Logging ${:.2f} for NVDA".format(value))
            f_out.write("{:.2f}\n".format(value))


def in_dir(directory):
    """Change current working directory to `directory`,
    allow the user to run some code, and change back.

    Args:
      directory (str): The path to a directory to work in.
    """
    current_dir = os.getcwd()
    os.chdir(directory)

    # Add code that lets you handle errors
    try:
        yield
    # Ensure the directory is reset,
    # whether there was an error or not
    finally:
        os.chdir(current_dir)
