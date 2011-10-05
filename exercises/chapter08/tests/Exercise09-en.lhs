Programming in Haskell: Chapter 8: Supplemental Exercise 9
==========================================================

This is a literate Haskell file.  Implement your solution below and test your
implementation with the included test cases.

Note that GHC 7.0.3 or greater is required.

You may ignore the following module declaration and imports.

> module Main (main) where
>
> -- base
> import Control.Exception (ErrorCall(..), evaluate, handleJust)
>
> -- hunit
> import Test.HUnit
>
> -- local
> import Parsing

Implement your solution here:

> eval :: String -> Float
> eval = undefined

To test: `runTests evalTests`

> evalTests :: [Test]
> evalTests = map TestCase
>   [ assertEqual "eval \"1\"" 1.0 (eval "1")
>   , assertEqual "eval \"+1\"" 1.0 (eval "+1")
>   , assertEqual "eval \"-1\"" (-1.0) (eval "-1")
>   , assertEqual "eval \"1.25\"" 1.25 (eval "1.25")
>   , assertEqual "eval \"+1.25\"" 1.25 (eval "+1.25")
>   , assertEqual "eval \"-1.25\"" (-1.25) (eval "-1.25")
>   , assertEqual "eval \"1.25E4\"" 12500.0 (eval "1.25E4")
>   , assertEqual "eval \"+1.25E4\"" 12500.0 (eval "+1.25E4")
>   , assertEqual "eval \"1.25E+4\"" 12500.0 (eval "1.25E+4")
>   , assertEqual "eval \"+1.25E+4\"" 12500.0 (eval "+1.25E+4")
>   , assertEqual "eval \"-1.25E4\"" (-12500.0) (eval "-1.25E4")
>   , assertEqual "eval \"-1.25E+4\"" (-12500.0) (eval "-1.25E+4")
>   , assertEqual "eval \"1.25E-1\"" 0.125 (eval "1.25E-1")
>   , assertEqual "eval \"+1.25E-1\"" 0.125 (eval "+1.25E-1")
>   , assertEqual "eval \"-1.25E-1\"" (-0.125) (eval "-1.25E-1")
>   , assertEqual "eval \" +1.25E-1 \"" 0.125 (eval " +1.25E-1 ")
>   , assertError "eval \"+ 1.25E-1\"" (eval "+ 1.25E-1")
>   , assertError "eval \"+1 .25E-1\"" (eval "+1 .25E-1")
>   , assertError "eval \"+1. 25E-1\"" (eval "+1. 25E-1")
>   , assertError "eval \"+1.25 E-1\"" (eval "+1.25 E-1")
>   , assertError "eval \"+1.25E -1\"" (eval "+1.25E -1")
>   , assertError "eval \"+1.25E- 1\"" (eval "+1.25E- 1")
>   , assertError "eval \".25E-1\"" (eval ".25E-1")
>   , assertError "eval \"+.25E-1\"" (eval "+.25E-1")
>   , assertError "eval \"-.25E-1\"" (eval "-.25E-1")
>   , assertError "eval \"1.\"" (eval "1.")
>   , assertError "eval \"1.E2\"" (eval "1.E2")
>   , assertError "eval \"+1.25E\"" (eval "+1.25E")
>   , assertError "eval \"+1.25E+\"" (eval "+1.25E+")
>   , assertError "eval \"+1.25E-\"" (eval "+1.25E-")
>   , assertEqual "eval \"1.25 * -1E-1\"" (-0.125) (eval "1.25 * -1E-1")
>   , assertEqual "eval \"4.5 / 5E-1\"" 9.0 (eval "4.5 / 5E-1")
>   , assertEqual "eval \"3E1 + +2E0\"" 32.0 (eval "3E1 + +2E0")
>   , assertEqual "eval \"3E1++2E0\"" 32.0 (eval "3E1++2E0")
>   , assertEqual "eval \"3E1 - -2E0\"" 32.0 (eval "3E1 - -2E0")
>   , assertEqual "eval \"3E1--2E0\"" 32.0 (eval "3E1--2E0")
>   , assertEqual "eval \"(1E2 + +2E1 - 3E1)\"" 90.0 (eval "(1E2 + +2E1 - 3E1)")
>   , assertEqual "eval \"+2.0 * 3E0 + 4\"" 10.0 (eval "+2.0 * 3E0 + 4")
>   , assertEqual "eval \"+2.0 * (3E0 + 4)\"" 14.0 (eval "+2.0 * (3E0 + 4)")
>   , assertEqual "eval \"8E0 / +4.0 - 2\"" 0.0 (eval "8E0 / +4.0 - 2")
>   , assertEqual "eval \"8E0 / (+4.0 - 2)\"" 4.0 (eval "8E0 / (+4.0 - 2)")
>   , assertError "eval \"a1\"" (eval "a1")
>   , assertError "eval \"1a\"" (eval "1a")
>   ]

> assertError :: String -> a -> Assertion
> assertError msg x = handleJust errorCalls (const $ return ()) $ do
>     evaluate x
>     assertFailure $ msg Prelude.++ ": error not thrown"
>   where
>     errorCalls (ErrorCall _) = Just ()

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> main :: IO Counts
> main = runTests evalTests
