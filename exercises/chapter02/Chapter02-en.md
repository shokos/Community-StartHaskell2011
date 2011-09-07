Supplemental Exercises: Chapter 2
=================================

These are supplemental exercises for chapter 2 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (page 16).

Exercise 6
----------

Parenthesise the following arithmetic expressions:

1. `a * a + 2 * a * b + b * b`
2. `a ^ 2 - 2 * a * b + b ^ 2`

Exercise 7
----------

Define a function `degFtoC` to convert from degrees Fahrenheit to degrees
Celsius.

    C = (F - 32) * 5/9

Check your implementation against the following test cases:

    > degFtoC 32
    0.0
    > degFtoC 212
    100.0
    > degFtoC 77
    25.0

Write a function `degCtoF` to convert from degrees Celcius to degrees
Fahrenheit.

Check your implementation against the following test cases:

    > degCtoF 0
    32.0
    > degCtoF 100
    212.0
    > degCtoF 25
    77.0

Exercise 8
----------

Using the library functions introduced in the chapter, define a function
`takeLast` that selects the last *n* elements of a list.

Check your implementation against the following test cases:

    > takeLast 3 [1,2,3,4,5]
    [3,4,5]
    > takeLast 2 [1,2]
    [1,2]

Can you think of another possible definition?  Implement it as `takeLast'` and
check it against the same test cases.
