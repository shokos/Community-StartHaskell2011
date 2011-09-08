Supplemental Exercises: Chapter 7
=================================

These are supplemental exercises for chapter 7 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (pages 72 and
73).

Exercise 10
-----------

Translate the following function to use `filter` and `map` instead of a list
comprehension.

    import Data.Char (isAsciiUpper, ord, toUpper)

    foo :: String -> [Int]
    foo xs = [ord x' + c | x <- xs, let x' = toUpper x, isAsciiUpper x']
      where
          c = 1 - ord 'A'

Check your implementation against the following test case:

    > foo "Haskell!"
    [8,1,19,11,5,12,12]

Exercise 11
-----------

Implement a function `luhncheck :: String -> Bool` that uses the Luhn
algorithm to validate credit card checksums.  The function should accept
credit card numbers in all formats, ignoring any non-digit character.  You may
use the `digitToInt` and `isDigit` functions defined in the `Data.Char`
module.

http://en.wikipedia.org/wiki/Luhn_algorithm

Check your implementation against the following test cases:

    > luhncheck "1234-5678-9012-3452"
    True
    > luhncheck "4417123456789113"
    True
    > luhncheck "4408 0412 3456 7890"
    False

Exercise 12
-----------

The function `concat :: [[a]] -> [a]` that concatenates a list of lists into a
single list was defined in an exercise in chapter 6.  Implement the function
as `concatR` using a right fold.  Also implement the function as `concatL`
using a left fold.

Check your implementations against the following test cases:

    > concatR [[1,2],[3],[],[4,5]]
    [1,2,3,4,5]
    > concatL [[1,2],[3],[],[4,5]]
    [1,2,3,4,5]
    > concatR []
    []
    > concatL []
    []

Which version is better?  Why?

Exercise 13
-----------

In chapter 6, we defined a recursive function
`merge :: Ord a => [a] -> [a] -> [a]` that merges two sorted lists to give a
single sorted list.  How would you merge an arbitrary number of sorted lists
to give a single sorted list?  Define a function `nmerge` to do so.

Check your implementation against the following test case:

    > nmerge [[9],[2,5,7],[1,4],[],[3,6],[8]]
    [1,2,3,4,5,6,7,8,9]

Exercise 14
-----------

Using a fold, define the function `count :: (a -> Bool) -> [a] -> Int` that
returns the number of elements in a list that match a predicate.

Check your implementation against the following test cases:

    > count (== 1) [1,2,1,3,4,1,5,1]
    4
    > count (\x -> x `mod` 2 == 0) [1,2,1,3,4,1,5,1]
    2
    > count id [True,False,True,True]
    3
