Supplemental Exercises: Chapter 3
=================================

These are supplemental exercises for chapter 3 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (pages 28 and
29).

Exercise 5
----------

Why is the following invalid?

    [('a', True), (False, 'b')]

Exercise 6
----------

What are the types of the following values?

1. `(False, 'x', True)`
2. `[False, True, False]`
3. `[['0', '2', '4'], ['1', '3', '5']]`

Exercise 7
----------

What are the types of the following functions?

1. `headOfHead xs = head (head xs)`
2. `isADeal priceFor1 priceFor2 = priceFor2 / 2 < priceFor1`
3. `total fees discounts = (sum fees) - (sum discounts)`

Exercise 8
----------

Is it possible for a function of type `foo :: [a] -> a` to return the last
element of a list?  If not, why not?

Exercise 9
----------

Is it possible for a function of type `foo :: [a] -> a` to return a random
element of a list?  If not, why not?

Exercise 10
-----------

Is it possible for a function of type `foo :: [a] -> a` to compute the sum of
a list of numbers?  If not, why not?

Exercise 11
-----------

Is it possible for a function of type `foo :: [a] -> [a]` to reverse a list?
If not, why not?

Exercise 12
-----------

Is it possible for a function of type `foo :: [a] -> [a]` to sort a list?  If
not, why not?

Exercise 13
-----------

What might a function of type `foo :: (Char -> Bool) -> String -> String` do?
Give five examples.

Exercise 14
-----------

What might a function of type `foo :: (b -> c) -> (a -> b) -> (a -> c)` do?
Give as many examples as you can.

Exercise 15
-----------

What might a function of type `foo :: Ord a => a -> [a] -> ([a], [a])` do?
