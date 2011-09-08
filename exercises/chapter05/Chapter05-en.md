Supplemental Exercises: Chapter 5
=================================

These are supplemental exercises for chapter 5 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (pages 46 and
47).

Exercise 9
----------

In exercise 3, you wrote a function `pyths` to list all pythagorean triples
whose components are at most a given limit.  Assuming that the order of the
components is arbitrary, modify your function so that there are no duplicates.

Check your implementation against the following test case:

    > pyths 10
    [(3,4,5),(6,8,10)]

Exercise 10
-----------

Write a function `vowelPositions :: String -> [Int]` that returns the
(1-based) indexes of English vowels in a string using a list comprehension.

Check your implementation against the following test cases:

    > vowelPositions "Start Haskell"
    [3,8,11]
    > vowelPositions "Applicative"
    [1,5,7,9,11]
    > vowelPositions "rnd"
    []
    > vowelPositions ""
    []

Exercise 11
-----------

Write a function `stddev :: [Double] -> Double` that computes a sample
standard deviation using a list comprehension.

http://en.wikipedia.org/wiki/Standard_deviation

Check your implementation against the following test case:

    > stddev [4, 2, 5, 8, 6]
    2.23606797749979

A limitation of this function is that it only works with `Double` values.
Write a more general version `stddev' :: Real a => [a] -> Double`.  You will
need to use the `toRational` and `fromRational` functions, both defined in the
`Prelude`.

Check your implementation against the following test cases:

    > stddev' ([4, 2, 5, 8, 6] :: [Int])
    2.23606797749979
    > stddev' ([4, 2, 5, 8, 6] :: [Float])
    2.23606797749979
