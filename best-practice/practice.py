from typing import Callable, Iterable, List, Union

NUMBERS_TO_DOUBLE = [1, 5, 9, 15, 21, 23]


def generate_sequence(start: int = 1, stop: int = 6) -> List[int]:
    """Return the numbers from start (inclusive) to stop (exclusive)."""
    return list(range(start, stop))


def double_values(values: Iterable[int]) -> List[int]:
    """Return each value doubled."""
    return [value * 2 for value in values]


def cube_or_even_label(limit: int = 10) -> List[Union[int, str]]:
    """Cube odd numbers; label even numbers as 'even' for 1..limit-1."""
    return [number ** 3 if number % 2 else "even" for number in range(1, limit)]


def square(value: int) -> int:
    return value ** 2


def half(value: float) -> float:
    return value / 2


def add_with_callback(value: int, callback: Callable[[int], int]) -> int:
    """Add value to the result of callback(value)."""
    return value + callback(value)


def main() -> None:
    for number in generate_sequence():
        print(number)

    print(double_values(NUMBERS_TO_DOUBLE))
    print(cube_or_even_label())
    print(square(4))
    print(half(11))
    print(add_with_callback(3, square))


if __name__ == "__main__":
    main()

