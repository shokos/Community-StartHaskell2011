Homework 1
==========

This homework covers chapters 1, 2, 3, and 4 of _Programming in Haskell_.

Exercise 1
----------

Define a function `magComp` to compare the magnitude of two earthquakes.

    magComp :: Float  -- magnitude of earthquake1 (M)
            -> Float  -- magnitude of earthquake2 (M)
            -> Float  -- strength of earthquake1 compared to earthquake2

For example, a magnitude 9.0 earthquake releases 1000 times more energy than a
magnitude 7.0 earthquake.

http://en.wikipedia.org/wiki/Richter_magnitude_scale

    > magComp 9 7
    1000.0

In GHCi, use `:t (^)` to show the type of the `(^)` function.  You can see
that the function only works with *Integral* exponents.  You may use the
`(**)` function, also defined in the *Prelude*, which works with *Floating*
exponents.  Check the type with `:t (**)`.

Check your implementation against the following test cases:

    > magComp 7.0 6.2
    15.848943
    > magComp 6.8 7.0
    0.50118756

Exercise 2
----------

Define a function `approxEq` that checks for approximate equality.

    approxEq :: Float  -- delta
             -> Float  -- value1
             -> Float  -- value2
             -> Bool   -- True if value2 in (value1 - delta, value1 + delta)

Check your implementation against the following test cases:

    > approxEq 0.01 0 0.01
    False
    > approxEq 0.01 0 0.0099
    True
    > approxEq 0.001 (22 / 7) pi
    False
    > approxEq 0.01 (22 / 7) pi
    True

Using currying, one can define a function `approxEq'`, which checks for
approximate equivalence with a delta of `0.0001`, as follows:

    approxEq' :: Float  -- value1
              -> Float  -- value2
              -> Bool   -- True if value2 in (value1 - .0001, value1 + .0001)
    approxEq' = approxEq 0.0001

Here is a test case:

    > (99 / 70) `approxEq'` (sqrt 2)
    True

Using currying, define a function `approxZero` that checks if the passed
number is within `0.0001` of `0`.

    approxZero :: Float  -- value
               -> Bool   -- True if value in (-0.0001, 0.0001)

Check your implementation against the following test cases:

    > approxZero (-1 / 999)
    False
    > approxZero (0.5 ^ 14)
    True

Exercise 3
----------

Write a function `compLevel` to calculate the approximate video compression
level of a video file.

    compLevel :: (Int, Int)  -- width (pixels), height (pixels)
              -> Float       -- framerate (frames / second)
              -> Int         -- length (seconds)
              -> Float       -- audio bitrate (Kb / second)
              -> Float       -- file size (MiB)
              -> Float       -- video compression level

For this exercise, the video compression level is the uncompressed video
bitrate divided by the compressed video bitrate.  Assume a color depth of 24
bits per pixel.  The tricky part of this calculation is keeping the units
straight.  Note that the file size is measured in mebibytes (1024 x 1024
bytes) while the bitrate is measured in kilobits (1000 bits) per second.

Check your implementation against the following test cases:

    > compLevel (720, 480) (30000 / 1001) (120 * 60) 128 700
    361.5448
    > compLevel (352, 288) 25 (120 * 60) 128 700
    88.466

Exercise 4
----------

Using the library functions introduced in chapter 2, define a function
`revmid` that reverses all but the first and last items of a list.  Include a
type declaration for your function.

Check your implementation against the following test cases:

    > revmid []
    []
    > revmid [1,2]
    [1,2]
    > revmid [1,2,3,4,5]
    [1,4,3,2,5]

Exercise 5
----------

At a family get-together, my sister-in-law, who works at an earthquake
research institute, asked for help with a problem that she was working on.
Essentially, the task is to validate the order of vertices of a triangular
prism, which may be rotated to any orientation in 3D space.  The vertices
must be in the order specified by the attached figure.

Implement a solution in Haskell, using a right-handed coordinate system.

    isValidTP :: (Float, Float, Float)  -- vertex1 (X,Y,Z)
              -> (Float, Float, Float)  -- vertex2 (X,Y,Z)
              -> (Float, Float, Float)  -- vertex3 (X,Y,Z)
              -> (Float, Float, Float)  -- vertex4 (X,Y,Z)
              -> (Float, Float, Float)  -- vertex5 (X,Y,Z)
              -> (Float, Float, Float)  -- vertex6 (X,Y,Z)
              -> Bool                   -- True if order is correct

Check your implementation against the following test cases:

    > isValidTP (2,0,0) (2,2,0) (0,2,2) (0,0,2) (-2,2,0) (-2,0,0)
    True
    > isValidTP (2,0,0) (2,-2,0) (0,-2,-2) (0,0,-2) (-2,-2,0) (-2,0,0)
    True
    > isValidTP (2,0,0) (2,2,0) (0,2,2) (0,0,2) (-2,0,0) (-2,2,0)
    False
    > isValidTP (2,0,0) (2,-2,0) (0,-2,-2) (0,0,-2) (-2,0,0) (-2,-2,0)
    False
    > isValidTP (0,0,1) (0,1,1) (1,1,0) (1,0,0) (-1,1,0) (-1,0,0)
    False

(Here we use tuples, but in the future we will learn how to use data
structures to make this code a lot cleaner.)
