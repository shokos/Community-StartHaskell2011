In chapter 5, you wrote a function `pyths` to list all pythagorean triples
whose components are at most a given limit, and then you modified the function
to not include duplicates.  Using a list comprehension, define a function
`ipyths :: [(Int, Int, Int)]` that generates an infinite list of *all*
pythagorean triples, without duplicates.

Check your implementation against the following test case:

    > take 6 ipyths
        [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20)]

> ipyths :: [(Int, Int, Int)]
> ipyths = [(x, y, z) | z <- [1..],
>                       y <- [1..z],
>                       x <- [1..y],
>                       x ^ 2 + y ^ 2 == z ^ 2]
