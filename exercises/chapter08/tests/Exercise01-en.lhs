Programming in Haskell: Chapter 8: Exercise 1
=============================================

This is a literate Haskell file.  Implement your solution below and test your
implementation with the included test cases.

You may ignore the following module declaration and imports.

> module Main (main) where
>
> -- hunit
> import Test.HUnit
>
> -- local
> import Parsing

Implement your solution here:

> myInt :: Parser Int
> myInt = undefined

To test: `runTests myIntTests`

> myIntTests :: [Test]
> myIntTests = map TestCase
>   [ assertEqual "parse myInt \"1\"" [(1,"")] (parse myInt "1")
>   , assertEqual "parse myInt \"123\"" [(123,"")] (parse myInt "123")
>   , assertEqual "parse myInt \"-1\"" [(-1,"")] (parse myInt "-1")
>   , assertEqual "parse myInt \"-123\"" [(-123,"")] (parse myInt "-123")
>   , assertEqual "parse myInt \"123a\"" [(123,"a")] (parse myInt "123a")
>   , assertEqual "parse myInt \"-123a\"" [(-123,"a")] (parse myInt "-123a")
>   , assertEqual "parse myInt \"a1\"" [] (parse myInt "a1")
>   , assertEqual "parse myInt \"--1\"" [] (parse myInt "--1")
>   ]

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> main :: IO Counts
> main = runTests myIntTests
