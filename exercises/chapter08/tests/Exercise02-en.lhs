Programming in Haskell: Chapter 8: Exercise 2
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

> comment :: Parser ()
> comment = undefined

To test: `runTests commentTests`

> commentTests :: [Test]
> commentTests = map TestCase
>   [ assertEqual "parse comment \"-- Comment\""
>                 [((),"")]
>                 (parse comment "-- Comment")
>   , assertEqual "parse comment \"a-- Comment\""
>                 []
>                 (parse comment "a-- Comment")
>   , assertEqual "parse comment \"-- Comment\na\""
>                 [((),"\na")]
>                 (parse comment "-- Comment\na")
>   ]

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> main :: IO Counts
> main = runTests commentTests
