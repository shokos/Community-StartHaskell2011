from math import sqrt

# calculate the nth Fibonnaci number
def fib(n):
    root5 = sqrt(5)
    return round(((1 + root5) ** n - (1 - root5) ** n) / (2 ** n * root5))
