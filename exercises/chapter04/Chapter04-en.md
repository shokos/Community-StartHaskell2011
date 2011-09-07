Supplemental Exercises: Chapter 4
=================================

These are supplemental exercises for chapter 4 of _Programming in Haskell_.
Do these exercises after doing all of the exercises in the book (page 37).

Exercise 7
----------

Why is the following expression invalid?

    if 1 then 'a' else 'b'

Exercise 8
----------

Why is the following expression invalid?

    if True then 1 else 'b'

Exercise 9
----------

The *cons* operator `(:)` constructs a list by prepending an element to the
start of a list.  The *append* operator `(++)` appends one list to another.
Confirm the types of these functions in GHCi using `:t (:)` and `:t (++)`.

To verify that you understand how to use these operators, implement a function
that creates a single list out of all of its arguments, in order:

    hoge :: a -> [a] -> a -> [a] -> [a] -> (a, a) -> [a]

Check your implementation against the following test cases:

    > hoge 1 [2,3] 4 [5] [6,7] (8,9)
    [1,2,3,4,5,6,7,8,9]
    > hoge 1 [] 2 [] [] (3,4)
    [1,2,3,4]

Exercise 10
-----------

The function `isPrefixOf`, defined in the `Data.List` module, determines if a
list is a prefix of another list:

    isPrefixOf :: Eq a => [a]   -- list1
                       -> [a]   -- list2
                       -> Bool  -- True if list1 is a prefix of list2

Show that this function can be defined using guards and the library functions
introduced in chapter 2.

Do the same thing for `isSuffixOf`, which is defined in the same module:

    isSuffixOf :: Eq a => [a]   -- list1
                       -> [a]   -- list2
                       -> Bool  -- True if list1 is a suffix of list2

Check your implementations against the following test cases:

    > [1,2] `isPrefixOf` [1,2,3,4]
    True
    > [3,4] `isSuffixOf` [1,2,3,4]
    True
    > [4] `isPrefixOf` [1,2,3,4]
    False
    > [1] `isSuffixOf` [1,2,3,4]
    False
    > [] `isPrefixOf` [1,2,3,4]
    True
    > [] `isSuffixOf` [1,2,3,4]
    True
    > [1] `isPrefixOf` []
    False
    > [1] `isSuffixOf` []
    False

Exercise 11
-----------

Using pattern matching, define the standard boolean operators `nand` and
`nor`.  Define the standard boolean operator `xor` any way you like.  Using
only these operators, define a function `fullAdder` as follows:

    fullAdder :: Bool          -- input1
              -> Bool          -- input2
              -> Bool          -- input carry bit
              -> (Bool, Bool)  -- (output, output carry bit)

http://en.wikipedia.org/wiki/Full_adder

Check your implementation against the following test cases:

    > fullAdder False False False
    (False, False)
    > fullAdder False True False
    (True, False)
    > fullAdder True True False
    (False, True)
    > fullAdder False False True
    (True, False)
    > fullAdder True False True
    (False, True)
    > fullAdder True True True
    (True, True)

Exercise 12
-----------

Write the following function as a function with no parameters that returns a
lambda function:

    lenCMtoIN :: Float -> Float
    lenCMtoIN cm = cm / 2.54

Check your implementation against the following test cases:

    > lenCMtoIN 2.54
    1.0
    > lenCMtoIN 1
    0.39370078740157477

Exercise 13
-----------

Write the following function as a function with no parameters that returns a
lambda function:

    average :: Float -> Float -> Float
    average x y = (x + y) / 2

Check your implementation against the following test cases:

    > average 1 10
    5.5
    > average 2 4
    3.0

Exercise 14
-----------

Write the following function as a function with no parameters that returns a
lambda function:

    bound :: (Int, Int) -> Int -> Int
    bound (low, high) x | x < low   = low
                        | x > high  = high
                        | otherwise = x

Check your implementation against the following test cases:

    > bound (0,100) 101
    100
    > bound (32,212) 20
    32
    > bound (0,100) 99
    99

Exercise 15
-----------

Write the function `lenCMtoIN` using a section instead of a lambda function.

Check your implementation against the following test cases:

    > lenCMtoIN 2.54
    1.0
    > lenCMtoIN 1
    0.39370078740157477

Exercise 16
-----------

The following is imperative pseudocode (aka Python) for computing the length
of the hypotenuse of a right triangle using the Pythagorean Theorem.  Write a
Haskell equivalent.

    # calculate the length of the hypotenuse of a right triangle
    def pythag(a, b):
        return sqrt(a * a + b * b)

You may use the `sqrt :: Floating a => a -> a` function defined in the
*Prelude*.

Check your implementation against the following test cases:

    > pythag 3 4
    5.0
    > pythag 10 10
    14.142135623730951

Exercise 17
-----------

The following is imperative pseudocode (aka Python) for computing Fibonnaci
numbers using Binet's formula.  Write a Haskell equivalent of type
`fib :: Int -> Int`.

    # calculate the nth Fibonnaci number
    def fib(n):
        root5 = sqrt(5)
        return round(((1 + root5) ** n - (1 - root5) ** n) / (2 ** n * root5))

You will need to use the `fromIntegral` and `round` functions, both defined in
the *Prelude*, to convert values from *Int* to *Float* and vice-versa.

Check your implementation against the following test cases:

    > fib 1
    1
    > fib 2
    1
    > fib 3
    2
    > fib 4
    3
    > fib 5
    5
    > fib 20
    6765
