Define a function `asequence` that creates an infinite sequence of numbers,
starting at a given number, where the difference between consecutive elements
is defined by a given list of integers.  See the test cases for an example.

The function `cycle :: [a] :: [a]` creates an infinite repetition of a list.
Define `asequence` without using `cycle`, and then create a second version
`asequence2` that uses `cycle`.

Check your implementations against the following test cases:

    > take 10 (asequence 1 [1,2])
    [1,2,4,5,7,8,10,11,13,14]
    > take 10 (asequence2 1 [1,2])
    [1,2,4,5,7,8,10,11,13,14]

> asequence :: Int -> [Int] -> [Int]
> asequence start diffs = start : asequence' start diffs
>   where
>     asequence' x (y:ys) = let x' = x + y
>                           in  x' : asequence' x' ys
>     asequence' x _      = asequence' x diffs

> asequence2 :: Int -> [Int] -> [Int]
> asequence2 start diffs = start : asequence2' start (cycle diffs)
>   where
>     asequence2' x (y:ys) = let x' = x + y
>                            in  x' : asequence2' x' ys
