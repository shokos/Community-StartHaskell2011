Chapter 6: Supplement
=====================

n+k Pattern Conversion
----------------------

This chapter uses *n+k patterns* extensively, but these have been removed
from Haskell.  An example is the `factorial` function, defined on page 48:

    factorial :: Int -> Int
    factorial 0       = 1
    factorial (n + 1) = (n + 1) * factorial n

You can rewrite the function without using an *n+k pattern* as follows:

    factorial :: Int -> Int
    factorial 0 = 1
    factorial n = n * factorial (n - 1)
