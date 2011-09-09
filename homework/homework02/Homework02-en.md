Homework 2
==========

This homework covers chapters 1 through 7 of _Programming in Haskell_.

Exercise 1
----------

Modify the string transmitter program from chapter 7 to transmit information
across the channel in encrypted form using a one-time pad and a bitwise XOR
cipher.  Implement your own `xor` function.  You may use the `cycle`
function, which repeatedly cycles through the elements of a list, in case a
one-time pad is too short.

http://en.wikipedia.org/wiki/One-time_pad

http://en.wikipedia.org/wiki/XOR_cipher

Note the new types for the following functions:

* `encode :: String -> String -> [Bit]`
* `decode :: String -> [Bit] -> String`
* `transmit :: String -> String -> String`

Check your implementation against the following test cases:

    > encode "haskell" "abc"
    [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    > decode "haskell" [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    "abc"
    > decode "bad" [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    "kbt"
    > transmit "TooShortOTP" "higher-order functions are easy"
    "higher-order functions are easy"

Exercise 2
----------

Consider a function that filters a list using a predicate, returning a list
that includes the first element and any element that satisfies the predicate
when compared to its predecessor.  Define this function as `relFiltLC` using
a list comprehension.  Define the same function as `relFiltER` using explicit
recursion.  Define the same function as `relFiltHO` using higher-order
functions.

Check your implementation against the following test cases:

    > relFiltLC (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltLC (<) "hackyskewlol"
    "haskell"
    > relFiltER (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltER (<) "hackyskewlol"
    "haskell"
    > relFiltHO (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltHO (<) "hackyskewlol"
    "haskell"

Exercise 3
----------

Define a function `adler32 :: String -> String` that computes the Adler-32
checksum of a string.  The return value should be the checksum in hexadecimal.

http://en.wikipedia.org/wiki/Adler-32

Check your implementation against the following test cases:

    > adler32 "Wikipedia"
    "11E60398"
    > (adler32 . take 10000 . cycle) "haskell"
    "D8E52268"

If you compute checksums of larger strings, you may notice that your
implementation is quite slow.  There may be a number of reasons for this, but
one is that Strings are slow in Haskell because they are implemented with
lists.  There are other data structures (such as `Data.ByteString`) that are
much faster.

Exercise 4
----------

Using Newton's Method, define a function to calculate the integral root of a
number, within a given precision.  (Note that a real-world implementation
would measure precision in significant digits and require some floating
point format hacking, but do not worry about such issues for this exercise.)

http://en.wikipedia.org/wiki/Newton%27s_method

    nroot :: Double  -- precision
          -> Double  -- number
          -> Int     -- degree
          -> Double  -- root

Check your implementation against the following test cases:

    > nroot 0.0000001 2 2
    1.4142135623730951
    > nroot 0.0000001 2 3
    1.2599210498948732
    > nroot 0.1 2 2
    1.4166666666666667
    > nroot 0.1 2 3
    1.2609322247417485
    > nroot 1 2 2
    1.5
    > nroot 0.0001 1331 3
    11.000000000000142
    > nroot 0.0001 123456789 6
    22.314431636474602
    > nroot 0.0001 0.0001 6
    0.2154434765980944
    > nroot 0.0001 (-2) 3
    -1.2599210498953948
    > nroot 0.0001 (-2) 2
    *** Exception: even root of negative

(Your return values may vary from these, outside of the given precision.)
