Supplemental Exercises: Chapter 8
=================================

These are supplemental exercises for chapter 8 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (pages 85 and
86).

Exercise 9
----------

Modify the grammar and parser for arithmetic expressions to use `Float`s
instead of `Int`s.  Allow real numbers of the following formats:

* 1, +1
* -1
* 1.25, +1.25
* -1.25
* 1.25E4, +1.25E4, 1.25E+4, +1.25E+4
* -1.25E4, -1.25E+4
* 1.25E-1, +1.25E-1
* -1.25E-1

As in the implementation of `nat`, you may use the `read` function to convert
from a `String` to a `Float`.

Support addition, subtraction, multiplication, division, and parenthesised
expressions.
