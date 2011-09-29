Recursion Exercises
===================

To practice recursion, try defining the following functions from the `Prelude`
recursively (without using list comprehensions or higher order functions such
as `map` and `foldr`).

The exercises are divided into six sets.  When you are able to solve the
problems in a set very quickly, without confusion, you may skip the rest of
the exercises in the set and move on to the next set.

This is a literate Haskell file, so you may define the functions within this
file.  Note that GHC 7.0.3 or greater is required.  Here is a sample exercise:

    > factorial :: Int -> Int
    > factorial = undefined

When you solve an exercise, delete the `undefined` line and be sure to include
"bird tracks" (the `>` at the beginning of each line of code) in your
solution:

    > factorial :: Int -> Int
    > factorial n | n >= 2    = factorial' 1 n
    >             | n >= 0    = 1
    >             | otherwise = error "factorial of negative"
    >   where
    >     factorial' :: Int -> Int -> Int
    >     factorial' acc n | n < 2     = acc
    >                      | otherwise = factorial' (acc * n) (n - 1)

You may ignore the following module declaration and imports.

> module Main (main) where
>
> -- base
> import Control.Exception
> import Data.Char (isSpace)
> import Prelude hiding ((++), (!!), all, and, any, break, concat, concatMap,
>                        drop, dropWhile, elem, filter, foldl, foldr, init,
>                        last, length, lines, map, minimum, maximum, notElem,
>                        or, product, reverse, scanl, scanr, span, splitAt,
>                        sum, take, takeWhile, unlines, until, unwords, unzip,
>                        unzip3, words, zip, zip3, zipWith, zipWith3)
> import qualified Prelude ((++), concat, concatMap, map, take)
>
> -- hunit
> import Test.HUnit

Tests are included, using the HUnit package.  Install HUnit from the command
line using `cabal install hunit`.  You may use the `runTests` function
(defined below) to run the tests for a single exercise.  The exact command is
given for each exercise so that you can simply copy and paste it into GHCi.

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

To run tests for more than one exercise, uncomment the tests that you want to
run in the `tests` definition below.

> tests :: [[Test]]
> tests = [
>   --  appendTests
>   --, concatTests
>   --, mapTests
>   --, concatMapTests
>   --, filterTests
>   --, untilTests
>   --, andTests
>   --, orTests
>   --, anyTests
>   --, allTests
>   --, elemTests
>   --, notElemTests
>   --, zipTests
>   --, zip3Tests
>   --, zipWithTests
>   --, zipWith3Tests
>   --, unlinesTests
>   --, unwordsTests
>   --, lastTests
>   --, initTests
>   --, takeTests
>   --, dropTests
>   --, takeWhileTests
>   --, dropWhileTests
>   --, indexTests
>   --, sumTests
>   --, productTests
>   --, maximumTests
>   --, minimumTests
>   --, lengthTests
>   --, reverseTests
>   --, linesTests
>   --, wordsTests
>   --, splitAtTests
>   --, spanTests
>   --, breakTests
>   --, unzipTests
>   --, unzip3Tests
>   --, foldlTests
>   --, foldrTests
>   --, scanlTests
>   --, scanrTests
>   ]

Run them with `main`.

> main :: IO Counts
> main = runTests $ Prelude.concat tests

You may ignore the following function declaration.

> assertError :: String -> a -> Assertion
> assertError msg x = handleJust errorCalls (const $ return ()) $ do
>     evaluate x
>     assertFailure $ msg Prelude.++ ": error not thrown"
>   where
>     errorCalls (ErrorCall _) = Just ()

Some of the tests take time to run, but they should not consume much memory
when implemented correctly.  You may adjust the size of tests by changing the
following constant.

> large :: Int
> large = 2 ^ 24

Set 1
-----

1. [(++)](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:-43--43-)

> (++) :: [a] -> [a] -> [a]
> (++) = undefined

To test: `runTests appendTests`

> appendTests :: [Test]
> appendTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "[1,2] ++ [3,4]" ([1,2] ++ [3,4]) [1,2,3,4]
>   , assertEqual "[] ++ [1,2]" ([] ++ [1,2]) [1,2]
>   , assertEqual "[1,2] ++ []" ([1,2] ++ []) [1,2]
>   , assertEqual "[] ++ []" ([] ++ []) ([] :: [Int])
>   -- infinite/large test cases
>   , assertEqual "take 3 (cycle [1,2] ++ [3,4])"
>                 (Prelude.take 3 (cycle [1,2] ++ [3,4])) [1,2,1]
>   , assertEqual "take 3 ([1,2] ++ (cycle [3,4]))"
>                 (Prelude.take 3 ([1,2] ++ (cycle [3,4]))) [1,2,3]
>   ]

2. [concat](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:concat)

> concat :: [[a]] -> [a]
> concat = undefined

To test: `runTests concatTests`

> concatTests :: [Test]
> concatTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "concat [[1,2],[3],[]]" (concat [[1,2],[3],[]]) [1,2,3]
>   , assertEqual "concat [[1],[2,3],[]]" (concat [[1],[2,3],[]]) [1,2,3]
>   , assertEqual "concat [[],[1],[2,3]]" (concat [[],[1],[2,3]]) [1,2,3]
>   , assertEqual "concat []" (concat []) ([] :: [Int])
>   , assertEqual "concat [[]]" (concat [[]]) ([] :: [Int])
>   -- infinite/large test cases
>   , assertEqual "take 5 (concat [[1,2], cycle [3,4], []])"
>                 (Prelude.take 5 (concat [[1,2], cycle [3,4], []])) [1,2,3,4,3]
>   ]

3. [map](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:map)

> map :: (a -> b) -> [a] -> [b]
> map = undefined

To test: `runTests mapTests`

> mapTests :: [Test]
> mapTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "map (\\x -> x + 1) [1,2,3]"
>                 (map (\x -> x + 1) [1,2,3]) [2,3,4]
>   , assertEqual "map (\\x -> x + 1) []" (map (\x -> x + 1) []) []
>   -- infinite/large test cases
>   , assertEqual "take 5 (map (\\x -> x + 1) [1..])"
>                 (Prelude.take 5 (map (\x -> x + 1) [1..])) [2,3,4,5,6]
>   ]

4. [concatMap](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:concatMap)

> concatMap :: (a -> [b]) -> [a] -> [b]
> concatMap = undefined

To test: `runTests concatMapTests`

> concatMapTests :: [Test]
> concatMapTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "concatMap (\\x -> [x, -x]) [1,2]"
>                 (concatMap (\x -> [x, -x]) [1,2]) [1,-1,2,-2]
>   , assertEqual "concatMap (\\x -> [x, -x]) []"
>                 (concatMap (\x -> [x, -x]) []) []
>   -- infinite/large test cases
>   , assertEqual "take 3 (concatMap (\\x -> [x, -x])"
>                 (Prelude.take 3 (concatMap (\x -> [x, -x]) [1..])) [1,-1,2]
>   ]

5. [filter](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:filter)

> filter :: (a -> Bool) -> [a] -> [a]
> filter = undefined

To test: `runTests filterTests`

> filterTests :: [Test]
> filterTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "filter even [1,2,3,4]" (filter even [1,2,3,4]) [2,4]
>   , assertEqual "filter even [1,3,5]" (filter even [1,3,5]) []
>   , assertEqual "filter even []" (filter even []) ([] :: [Int])
>   -- infinite/large test cases
>   , assertEqual "take 5 (filter even [1..])"
>                 (Prelude.take 5 (filter even [1..])) [2,4,6,8,10]
>   ]

6. [until](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:until)

> until :: (a -> Bool) -> (a -> a) -> a -> a
> until = undefined

To test: `runTests untilTests`

> untilTests :: [Test]
> untilTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "until (<= 1.0) (/ 2) 100.0"
>                 (until (<= 1.0) (/ 2) 100.0) 0.78125
>   ]

7. [and](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:and)

> and :: [Bool] -> Bool
> and = undefined

To test: `runTests andTests`

> andTests :: [Test]
> andTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "and [True,True,True]" (and [True,True,True]) True
>   , assertEqual "and [True,False,True]" (and [True,False,True]) False
>   , assertEqual "and []" (and []) True
>   -- infinite/large test cases
>   , assertEqual "and (cycle [True,False])" (and (cycle [True,False])) False
>   , assertEqual "and (replicate (2 ^ 24) True)"
>                 (and (replicate (2 ^ 24) True)) True
>   ]

8. [or](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:or)

> or :: [Bool] -> Bool
> or = undefined

To test: `runTests orTests`

> orTests :: [Test]
> orTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "or [False,True,False]" (or [False,True,False]) True
>   , assertEqual "or [False,False,False]" (or [False,False,False]) False
>   , assertEqual "or []" (or []) False
>   -- infinite/large test cases
>   , assertEqual "or (cycle [False,True])" (or (cycle [False,True])) True
>   , assertEqual "or (replicate (2 ^ 24) False)"
>                 (or (replicate (2 ^ 24) False)) False
>   ]

9. [any](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:any)

> any :: (a -> Bool) -> [a] -> Bool
> any = undefined

To test: `runTests anyTests`

> anyTests :: [Test]
> anyTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "any even [1,2,3]" (any even [1,2,3]) True
>   , assertEqual "any even [1,3,5]" (any even [1,3,5]) False
>   , assertEqual "any even []" (any even []) False
>   -- infinite/large test cases
>   , assertEqual "any even [1..]" (any even [1..]) True
>   , assertEqual "any even [2 * x + 1 | x <- [1..large]]"
>                 (any even [2 * x + 1 | x <- [1..large]]) False
>   ]

10. [all](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:all)

> all :: (a -> Bool) -> [a] -> Bool
> all = undefined

To test: `runTests allTests`

> allTests :: [Test]
> allTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "all even [2,4,6]" (all even [2,4,6]) True
>   , assertEqual "all even [2,5,7]" (all even [2,5,7]) False
>   , assertEqual "all even []" (all even []) True
>   -- infinite/large test cases
>   , assertEqual "all even [1..]" (all even [1..]) False
>   , assertEqual "all even [2 * x | x <- [1..large]]"
>                 (all even [2 * x | x <- [1..large]]) True
>   ]

11. [elem](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:elem)

> elem :: Eq a => a -> [a] -> Bool
> elem = undefined

To test: `runTests elemTests`

> elemTests :: [Test]
> elemTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "2 `elem` [1,2,3]" (2 `elem` [1,2,3]) True
>   , assertEqual "4 `elem` [1,2,3]" (4 `elem` [1,2,3]) False
>   , assertEqual "1 `elem` []" (1 `elem` []) False
>   -- infinite/large test cases
>   , assertEqual "1331 `elem` [1..]" (1331 `elem` [1..]) True
>   , assertEqual "1331 `elem` [2 * x | x <- [1..large]]"
>                 (1331 `elem` [2 * x | x <- [1..large]]) False
>   ]

12. [notElem](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:notElem)

> notElem :: Eq a => a -> [a] -> Bool
> notElem = undefined

To test: `runTests notElemTests`

> notElemTests :: [Test]
> notElemTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "2 `notElem` [1,2,3]" (2 `notElem` [1,2,3]) False
>   , assertEqual "4 `notElem` [1,2,3]" (4 `notElem` [1,2,3]) True
>   , assertEqual "1 `notElem` []" (1 `notElem` []) True
>   -- infinite/large test cases
>   , assertEqual "1331 `notElem` [1..]" (1331 `notElem` [1..]) False
>   , assertEqual "1331 `notElem` [2 * x | x <- [1..large]]"
>                 (1331 `notElem` [2 * x | x <- [1..large]]) True
>   ]

13. [zip](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zip)

> zip :: [a] -> [b] -> [(a, b)]
> zip = undefined

To test: `runTests zipTests`

> zipTests :: [Test]
> zipTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "zip \"abc\" [1,2,3]"
>                 (zip "abc" [1,2,3]) [('a',1),('b',2),('c',3)]
>   , assertEqual "zip \"abc\" [1,2]"
>                 (zip "abc" [1,2]) [('a',1),('b',2)]
>   , assertEqual "zip \"ab\" [1,2,3]"
>                 (zip "ab" [1,2,3]) [('a',1),('b',2)]
>   , assertEqual "zip \"abc\" []"
>                 (zip "abc" []) ([] :: [(Char, Int)])
>   , assertEqual "zip \"\" [1,2,3]" (zip "" [1,2,3]) []
>   -- infinite/large test cases
>   , assertEqual "zip \"abc\" [1..]"
>                 (zip "abc" [1..]) [('a',1),('b',2),('c',3)]
>   , assertEqual "zip [1..] \"abc\""
>                 (zip [1..] "abc") [(1,'a'),(2,'b'),(3,'c')]
>   , assertEqual "take 3 (zip [1..] [2..])"
>                 (Prelude.take 3 (zip [1..] [2..])) [(1,2),(2,3),(3,4)]
>   ]

14. [zip3](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zip3)

> zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
> zip3 = undefined

To test: `runTests zip3Tests`

> zip3Tests :: [Test]
> zip3Tests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "zip3 \"abc\" [1,2,3] [False,True,False]"
>                 (zip3 "abc" [1,2,3] [False,True,False])
>                 [('a',1,False),('b',2,True),('c',3,False)]
>   , assertEqual "zip3 \"abc\" [1,2,3] [False, True]"
>                 (zip3 "abc" [1,2,3] [False, True])
>                 [('a',1,False),('b',2,True)]
>   , assertEqual "zip3 \"abc\" [1,2] [False,True,False]"
>                 (zip3 "abc" [1,2] [False,True,False])
>                 [('a',1,False),('b',2,True)]
>   , assertEqual "zip3 \"ab\" [1,2,3] [False,True,False]"
>                 (zip3 "ab" [1,2,3] [False,True,False])
>                 [('a',1,False),('b',2,True)]
>   , assertEqual "zip3 \"abc\" [1,2,3] []"
>                 (zip3 "abc" [1,2,3] [])
>                 ([] :: [(Char, Int, Bool)])
>   , assertEqual "zip3 \"abc\" [] [False,True,False]"
>                 (zip3 "abc" [] [False,True,False])
>                 ([] :: [(Char, Int, Bool)])
>   , assertEqual "zip3 \"\" [1,2,3] [False,True,False]"
>                 (zip3 "" [1,2,3] [False,True,False]) []
>   -- infinite/large test cases
>   , assertEqual "zip3 \"abc\" [1,2,3] (cycle [False,True])"
>                 (zip3 "abc" [1,2,3] (cycle [False,True]))
>                 [('a',1,False),('b',2,True),('c',3,False)]
>   , assertEqual "zip3 \"abc\" [1..] (cycle [False,True])"
>                 (zip3 "abc" [1..] (cycle [False,True]))
>                 [('a',1,False),('b',2,True),('c',3,False)]
>   , assertEqual
>       "take 3 (zip3 (cycle ['a'..'z']) [1..] (cycle [False,True]))"
>       (Prelude.take 3 (zip3 (cycle ['a'..'z']) [1..] (cycle [False,True])))
>       [('a',1,False),('b',2,True),('c',3,False)]
>   ]

15. [zipWith](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zipWith)

> zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
> zipWith = undefined

To test: `runTests zipWithTests`

> zipWithTests :: [Test]
> zipWithTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "zipWith (+) [1,2,3] [4,5,6]"
>                 (zipWith (+) [1,2,3] [4,5,6]) [5,7,9]
>   , assertEqual "zipWith (+) [1,2,3] [4,5]"
>                 (zipWith (+) [1,2,3] [4,5]) [5,7]
>   , assertEqual "zipWith (+) [1,2] [4,5,6]"
>                 (zipWith (+) [1,2] [4,5,6]) [5,7]
>   , assertEqual "zipWith (+) [] []"
>                 (zipWith (+) [] []) []
>   -- infinite/large test cases
>   , assertEqual "zipWith (+) [1,2,3] (cycle [1,0])"
>                 (zipWith (+) [1,2,3] (cycle [1,0])) [2,2,4]
>   , assertEqual "take 3 (zipWith (+) [1..] (cycle [1,0]))"
>                 (Prelude.take 3 (zipWith (+) [1..] (cycle [1,0]))) [2,2,4]
>   ]

16. [zipWith3](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zipWith3)

> zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
> zipWith3 = undefined

To test: `runTests zipWith3Tests`

> zipWith3Tests :: [Test]
> zipWith3Tests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2,3] [4,5,6] [7,8,9]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2,3] [4,5,6] [7,8,9])
>                 [11,18,27]
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2,3] [4,5,6] [7,8]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2,3] [4,5,6] [7,8])
>                 [11,18]
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2,3] [4,5] [7,8,9]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2,3] [4,5] [7,8,9])
>                 [11,18]
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2] [4,5,6] [7,8,9]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2] [4,5,6] [7,8,9])
>                 [11,18]
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [] [] []"
>                 (zipWith3 (\a b c -> a*b+c) [] [] [])
>                 []
>   -- infinite/large test cases
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2,3] [4,5,6] [7..]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2,3] [4,5,6] [7..])
>                 [11,18,27]
>   , assertEqual "zipWith3 (\\a b c -> a*b+c) [1,2,3] [4..] [7..]"
>                 (zipWith3 (\a b c -> a*b+c) [1,2,3] [4..] [7..])
>                 [11,18,27]
>   , assertEqual "take 3 (zipWith3 (\\a b c -> a*b+c) [1..] [4..] [7..])"
>                 (Prelude.take 3 (zipWith3 (\a b c -> a*b+c)
>                                           [1..] [4..] [7..]))
>                 [11,18,27]
>   ]

17. [unlines](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unlines)

For the sake of simplicity, assume a newline of `'\n'`, regardless of the
platform.

> unlines :: [String] -> String
> unlines = undefined

To test: `runTests unlinesTests`

> unlinesTests :: [Test]
> unlinesTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "unlines [\"one\",\"two\",\"three\"]"
>                 (unlines ["one","two","three"])
>                 "one\ntwo\nthree\n"
>   , assertEqual "unlines [\"one\"]" (unlines ["one"]) "one\n"
>   , assertEqual "unlines []" (unlines []) ""
>   -- infinite/large test cases
>   , assertEqual "take 16 (unlines (cycle [\"one\", \"two\"]))"
>                 (Prelude.take 16 (unlines (cycle ["one", "two"])))
>                 "one\ntwo\none\ntwo\n"
>   ]

18. [unwords](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unwords)

> unwords :: [String] -> String
> unwords = undefined

To test: `runTests unwordsTests`

> unwordsTests :: [Test]
> unwordsTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "unwords [\"one\",\"two\",\"three\"]"
>                 (unwords ["one","two","three"])
>                 "one two three"
>   , assertEqual "unwords [\"one\"]" (unwords ["one"]) "one"
>   , assertEqual "unwords []" (unwords []) ""
>   -- infinite/large test cases
>   , assertEqual "take 15 (unwords (cycle [\"one\", \"two\"]))"
>                 (Prelude.take 15 (unwords (cycle ["one", "two"])))
>                 "one two one two"
>   ]

Set 2
-----

19. [last](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:last)

> last :: [a] -> a
> last = undefined

To test: `runTests lastTests`

> lastTests :: [Test]
> lastTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "last [1,2,3]" (last [1,2,3]) 3
>   , assertError "last []" (last [])
>   -- infinite/large test cases
>   , assertEqual "last [1..large]" (last [1..large]) large
>   ]

20. [init](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:init)

> init :: [a] -> [a]
> init = undefined

To test: `runTests initTests`

> initTests :: [Test]
> initTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "init [1,2,3]" (init [1,2,3]) [1,2]
>   , assertError "init []" (init [])
>   -- infinite/large test cases
>   , assertEqual "head (init [1..])" (head (init [1..])) 1
>   ]

21. [take](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:take)

> take :: Int -> [a] -> [a]
> take = undefined

To test: `runTests takeTests`

> takeTests :: [Test]
> takeTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "take 2 [1,2,3]" (take 2 [1,2,3]) [1,2]
>   , assertEqual "take 0 [1,2,3]" (take 0 [1,2,3]) []
>   , assertEqual "take 4 [1,2,3]" (take 4 [1,2,3]) [1,2,3]
>   , assertEqual "take (-1) [1,2,3]" (take (-1) [1,2,3]) []
>   -- infinite/large test cases
>   , assertEqual "head (take large [1..])" (head (take large [1..])) 1
>   ]

22. [drop](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:drop)

> drop :: Int -> [a] -> [a]
> drop = undefined

To test: `runTests dropTests`

> dropTests :: [Test]
> dropTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "drop 2 [1,2,3]" (drop 2 [1,2,3]) [3]
>   , assertEqual "drop 0 [1,2,3]" (drop 0 [1,2,3]) [1,2,3]
>   , assertEqual "drop 5 [1,2,3]" (drop 4 [1,2,3]) []
>   , assertEqual "drop (-1) [1,2,3]" (drop (-1) [1,2,3]) [1,2,3]
>   -- infinite/large test cases
>   , assertEqual "head (drop 3 [1..])" (head (drop 3 [1..])) 4
>   ]

23. [takeWhile](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:takeWhile)

> takeWhile :: (a -> Bool) -> [a] -> [a]
> takeWhile = undefined

To test: `runTests takeWhileTests`

> takeWhileTests :: [Test]
> takeWhileTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "takeWhile even [2,4,5,6]" (takeWhile even [2,4,5,6]) [2,4]
>   , assertEqual "takeWhile even [1,2,3]" (takeWhile even [1,2,3]) []
>   , assertEqual "takeWhile even [2,4,6]" (takeWhile even [2,4,6]) [2,4,6]
>   , assertEqual "takeWhile even []" (takeWhile even []) []
>   -- infinite/large test cases
>   , assertEqual "head (takeWhile (> 0) [1..])"
>                 (head (takeWhile (> 0) [1..]))
>                 1
>   ]

24. [dropWhile](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:dropWhile)

> dropWhile :: (a -> Bool) -> [a] -> [a]
> dropWhile = undefined

To test: `runTests dropWhileTests`

> dropWhileTests :: [Test]
> dropWhileTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "dropWhile even [2,4,5,6]" (dropWhile even [2,4,5,6]) [5,6]
>   , assertEqual "dropWhile even [1,2,3]" (dropWhile even [1,2,3]) [1,2,3]
>   , assertEqual "dropWhile even [2,4,6]" (dropWhile even [2,4,6]) []
>   , assertEqual "dropWhile even []" (dropWhile even []) []
>   -- infinite/large test cases
>   , assertEqual "head (dropWhile even (cycle [2,4,6,9]))"
>                 (head (dropWhile even (cycle [2,4,6,9])))
>                 9
>   ]

Set 3
-----

25. [(!!)](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:-33--33-)

> (!!) :: [a] -> Int -> a
> (!!) = undefined

To test: `runTests indexTests`

> indexTests :: [Test]
> indexTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "[1,2,3] !! 0" ([1,2,3] !! 0) 1
>   , assertEqual "[1,2,3] !! 1" ([1,2,3] !! 1) 2
>   , assertEqual "[1,2,3] !! 2" ([1,2,3] !! 2) 3
>   , assertError "[1,2,3] !! (-1)" ([1,2,3] !! (-1))
>   , assertError "[1,2,3] !! 3" ([1,2,3] !! 3)
>   -- infinite/large test cases
>   , assertEqual "[1..] !! large" ([0..] !! large) large
>   ]

Set 4
-----

Use accumulators for all the functions in this set.

26. [sum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:sum)

> sum :: Num a => [a] -> a
> sum = undefined

To test: `runTests sumTests`

> sumTests :: [Test]
> sumTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "sum [1,2,3,4]" (sum [1,2,3,4]) 10
>   , assertEqual "sum [1,-1,2,-2]" (sum [1,-1,2,-2]) 0
>   , assertEqual "sum []" (sum []) 0
>   -- infinite/large test cases - requires tail recursion
>   --, assertEqual "sum (concatMap (\\n -> [n,-n]) [1..large])"
>   --              (sum (Prelude.concatMap (\n -> [n,-n]) [1..large]))
>   --              0
>   ]

27. [product](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:product)

> product :: Num a => [a] -> a
> product = undefined

To test: `runTests productTests`

> productTests :: [Test]
> productTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "product [1,2,3,4]" (product [1,2,3,4]) 24
>   , assertEqual "product [1,-1,2,-2]" (product [1,-1,2,-2]) 4
>   , assertEqual "product [0,1,2]" (product [0,1,2]) 0
>   , assertEqual "product []" (product []) 1
>   -- infinite/large test cases - requires tail recursion
>   --, assertEqual
>   --    "product (concatMap (\\n -> let n2 = 2*n in [n2,1/n2]) [1..large])"
>   --    (product (concatMap (\n -> let n2 = 2*n in [n2,1/n2]) [1..large]))
>   --    1.0
>   ]

28. [maximum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:maximum)

> maximum :: Ord a => [a] -> a
> maximum = undefined

To test: `runTests maximumTests`

> maximumTests :: [Test]
> maximumTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "maximum [1,5,9,3,7]" (maximum [1,5,9,3,7]) 9
>   , assertError "maximum []" (maximum ([] :: [Int]))
>   -- infinite/large test cases
>   , assertEqual "maximum [1..large]" (maximum [1..large]) large
>   ]

29. [minimum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:minimum)

> minimum :: Ord a => [a] -> a
> minimum = undefined

To test: `runTests minimumTests`

> minimumTests :: [Test]
> minimumTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "minimum [1,5,9,3,7]" (minimum [9,5,1,7,3]) 1
>   , assertError "minimum []" (minimum ([] :: [Int]))
>   -- infinite/large test cases
>   , assertEqual "minimum [1..large]" (minimum [1..large]) 1
>   ]

30. [length](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:length)

> length :: [a] -> Int
> length = undefined

To test: `runTests lengthTests`

> lengthTests :: [Test]
> lengthTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "length [1,2,3]" (length [1,2,3]) 3
>   , assertEqual "length []" (length []) 0
>   -- infinite/large test cases - requires tail recursion
>   --, assertEqual "length [1..large]" (length [1..large]) large
>   ]

31. [reverse](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:reverse)

> reverse :: [a] -> [a]
> reverse = undefined

To test: `runTests reverseTests`

> reverseTests :: [Test]
> reverseTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "reverse [1,2,3]" (reverse [1,2,3]) [3,2,1]
>   , assertEqual "reverse []" (reverse []) ([] :: [Int])
>   -- infinite/large test cases
>   , assertEqual "head (reverse [1..large])"
>                 (head (reverse [1..large]))
>                 large
>   ]

32. [lines](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:lines)

For the sake of simplicity, assume a newline of `'\n'`, regardless of the
platform.

> lines :: String -> [String]
> lines = undefined

To test: `runTests linesTests`

> linesTests :: [Test]
> linesTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "lines \"one\\ntwo\\nthree\\n\""
>                 (lines "one\ntwo\nthree\n")
>                 ["one","two","three"]
>   , assertEqual "lines \"\\n\\none\\n\\ntwo\\n\\nthree\\n\\n\""
>                 (lines "\n\none\n\ntwo\n\nthree\n\n")
>                 ["","","one","","two","","three",""]
>   , assertEqual "lines \"\\n\"" (lines "\n") [""]
>   -- infinite/large test cases
>   , assertEqual "head (lines (concat (repeat \"one\\n\")))"
>                 (head (lines (Prelude.concat (repeat "one\n"))))
>                 "one"
>   ]

33. [words](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:words)

You may use the `isSpace` function, defined in `Data.Char`.

> words :: String -> [String]
> words = undefined

To test: `runTests wordsTests`

> wordsTests :: [Test]
> wordsTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "words \"one two three\""
>                 (words "one two three")
>                 ["one","two","three"]
>   , assertEqual "words \" one\\ttwo\\nthree \""
>                 (words " one\ttwo\nthree ")
>                 ["one","two","three"]
>   , assertEqual "words \"i\\n \\t\\n\\n\\t \"" (words "\n \t\n\n\t ") []
>   -- infinite/large test cases
>   , assertEqual "head (words (concat (repeat \" one\")))"
>                 (head (words (Prelude.concat (repeat " one"))))
>                 "one"
>   ]

Set 5
-----

34. [splitAt](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:splitAt)

> splitAt :: Int -> [a] -> ([a], [a])
> splitAt = undefined

To test: `runTests splitAtTests`

> splitAtTests :: [Test]
> splitAtTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "splitAt 1 [1,2,3]" (splitAt 1 [1,2,3]) ([1],[2,3])
>   , assertEqual "splitAt 0 [1,2,3]" (splitAt 0 [1,2,3]) ([],[1,2,3])
>   , assertEqual "splitAt 4 [1,2,3]" (splitAt 4 [1,2,3]) ([1,2,3],[])
>   , assertEqual "splitAt (-1) [1,2,3]" (splitAt (-1) [1,2,3]) ([],[1,2,3])
>   -- infinite/large test cases
>   , assertEqual "head (fst (splitAt large [1..]))"
>                 (head (fst (splitAt large [1..])))
>                 1
>   ]

35. [span](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:span)

> span :: (a -> Bool) -> [a] -> ([a], [a])
> span = undefined

To test: `runTests spanTests`

> spanTests :: [Test]
> spanTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "span even [2,4,6,9]" (span even [2,4,6,9]) ([2,4,6],[9])
>   , assertEqual "span even [1,3,5,8]" (span even [1,3,5,8]) ([],[1,3,5,8])
>   , assertEqual "span even []" (span even []) ([],[])
>   -- infinite/large test cases
>   , assertEqual "head (fst (span (> 0) [1..]))"
>                 (head (fst (span (> 0) [1..])))
>                 1
>   ]

36. [break](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:break)

> break :: (a -> Bool) -> [a] -> ([a], [a])
> break = undefined

To test: `runTests breakTests`

> breakTests :: [Test]
> breakTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "break even [1,3,6,8]" (break even [1,3,6,8]) ([1,3],[6,8])
>   , assertEqual "break even [2,4,7,9]" (break even [2,4,7,9]) ([],[2,4,7,9])
>   , assertEqual "break even []" (break even []) ([],[])
>   -- infinite/large test cases
>   , assertEqual "head (fst (break (< 0) [1..]))"
>                 (head (fst (break (< 0) [1..])))
>                 1
>   ]

37. [unzip](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unzip)

> unzip :: [(a, b)] -> ([a], [b])
> unzip = undefined

To test: `runTests unzipTests`

> unzipTests :: [Test]
> unzipTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "unzip [(1,'a'),(2,'b'),(3,'c')]"
>                 (unzip [(1,'a'),(2,'b'),(3,'c')])
>                 ([1,2,3],"abc")
>   , assertEqual "unzip []" (unzip []) (([],[]) :: ([Int],[Char]))
>   -- infinite/large test cases
>   , assertEqual "head (fst (unzip [(x,x) | x <- [1..]]))"
>                 (head (fst (unzip [(x,x) | x <- [1..]])))
>                 1
>   ]

38. [unzip3](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unzip3)

> unzip3 :: [(a, b, c)] -> ([a], [b], [c])
> unzip3 = undefined

To test: `runTests unzip3Tests`

> unzip3Tests :: [Test]
> unzip3Tests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "unzip3 [(1,'a',True),(2,'b',False),(3,'c',True)]"
>                 (unzip3 [(1,'a',True),(2,'b',False),(3,'c',True)])
>                 ([1,2,3],"abc",[True,False,True])
>   , assertEqual "unzip3 []" (unzip3 []) (([],[],[]) :: ([Int],[Char],[Int]))
>   -- infinite/large test cases
>   , assertEqual "head ((\\(x,y,z) -> x) (unzip3 [(x,x,x) | x <- [1..]]))"
>                 (head ((\(x,y,z) -> x) (unzip3 [(x,x,x) | x <- [1..]])))
>                 1
>   ]

Set 6
-----

39. [foldl](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:foldl)

> foldl :: (a -> b -> a) -> a -> [b] -> a
> foldl = undefined

To test: `runTests foldlTests`

> foldlTests :: [Test]
> foldlTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "foldl (+) 0 [1,2,3]" (foldl (+) 0 [1,2,3]) 6
>   , assertEqual "foldl (+) 0 []" (foldl (+) 0 []) 0
>   , assertEqual "foldl (/) 1 [4,2,1]" (foldl (/) 1 [4,2,1]) 0.125
>   ]

40. [foldr](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:foldr)

> foldr :: (a -> b -> b) -> b -> [a] -> b
> foldr = undefined

To test: `runTests foldrTests`

> foldrTests :: [Test]
> foldrTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "foldr (+) 0 [1,2,3]" (foldr (+) 0 [1,2,3]) 6
>   , assertEqual "foldr (+) 0 []" (foldr (+) 0 []) 0
>   , assertEqual "foldr (/) 1 [4,2,1]" (foldr (/) 1 [4,2,1]) 2
>   ]

41. [scanl](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:scanl)

> scanl :: (a -> b -> a) -> a -> [b] -> [a]
> scanl = undefined

To test: `runTests scanlTests`

> scanlTests :: [Test]
> scanlTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "scanl (+) 0 [1,2,3]" (scanl (+) 0 [1,2,3]) [0,1,3,6]
>   , assertEqual "scanl (+) 0 []" (scanl (+) 0 []) [0]
>   , assertEqual "scanl (/) 1 [4,2,1]"
>                 (scanl (/) 1 [4,2,1])
>                 [1,0.25,0.125,0.125]
>   ]

42. [scanr](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:scanr)

> scanr :: (a -> b -> b) -> b -> [a] -> [b]
> scanr = undefined

To test: `runTests scanrTests`

> scanrTests :: [Test]
> scanrTests = Prelude.map TestCase
>   -- essential test cases
>   [ assertEqual "scanr (+) 0 [1,2,3]" (scanr (+) 0 [1,2,3]) [6,5,3,0]
>   , assertEqual "scanr (+) 0 []" (scanr (+) 0 []) [0]
>   , assertEqual "scanr (/) 1 [4,2,1]"
>                 (scanr (/) 1 [4,2,1])
>                 [2,2,1,1]
>   ]
