Supplemental Exercises: Chapter 6
=================================

These are supplemental exercises for chapter 6 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (pages 59 and
60).

Exercise 7
----------

Using mutual recursion, implement a function `everyOther` that returns a list
of every other element of the passed list, starting with the first one.

    everyOther :: [a] -> [a]

Check your implementation against the following test cases:

    > everyOther [1,2,3,4,5]
    [1,3,5]
    > everyOther "haskell"
    "hsel"
    > everyOther []
    []

Exercise 8
----------

Using recursion, implement the functions `maximum` and `minimum`, which find
the maximum and minimum elements of a list, respectively.  Be sure to specify
the type for each function.

Both of these functions are defined in the `Prelude` module.  This time,
instead of giving your functions different names, put the following line at
the top of your file to hide the `Prelude` definitions of the functions.

    import Prelude hiding (maximum, minimum)

Use the library function `error :: String -> a` to display a meaningful error
when called with an emtpy list.

Check your implementations against the following test cases:

    > maximum [2,7,5,2,9,1]
    9
    > minimum [2,7,5,2,9,1]
    1
    > minimum "haskell"
    'a'
    > maximum []
    *** Exception: maximum of empty list
    > minimum []
    *** Exception: minimum of empty list

Exercise 9
----------

In chapter 4, we defined `splitAt` using `take` and `drop`.  The definition is
simple and elegant, but notice that it requires traversing (the beginning of)
the list twice, once for each step.  Define the function using recursion, so
that only one traversal is needed.

Check your implementation against the following test cases:

    > splitAt 2 [1,2,3,4]
    ([1,2],[3,4])
    > splitAt 0 [1,2,3,4]
    ([],[1,2,3,4])
    > splitAt 4 [1,2,3,4]
    ([1,2,3,4],[])
    > splitAt 6 [1,2,3,4]
    ([1,2,3,4],[])
    > splitAt (-1) [1,2,3,4]
    ([],[1,2,3,4])
    > splitAt 2 []
    ([],[])

Exercise 10
-----------

Using recursion, define the function `slide :: Int -> [a] -> [[a]]`.

Check your implementation against the following test cases:

    > slide 3 "abcde"
    ["abc","bcd","cde","de","e"]
    > slide 3 "ab"
    ["ab","b"]
    > slide 3 ""
    []
    > slide 1 "abcde"
    ["a","b","c","d","e"]

We will learn about infinite structures in chapter 12.  To see if your
implementation works with infinite structures, try out the following test
case:

    > take 5 (slide 3 [1..])
    [[1,2,3],[2,3,4],[3,4,5],[4,5,6],[5,6,7]]

Does your implementation work?  Think about the reason for this.
