「プログラミングHaskell」：｛第｝｛だい｝8｛章｝｛しょう｝：｛問題｝｛もんだい｝9
=================================================================================

このファイルは｛文芸的｝｛ぶんげいてき｝プログラミングの｛形式｝｛けいしき｝で
｛書｝｛か｝いている。このファイルの｛中｝｛なか｝に｛関数｝｛かんすう｝を
｛定義｝｛ていぎ｝して、｛含｝｛ふく｝まれているテストで
｛確認｝｛かくにん｝せよ。

「GHC 7.0.3」｛以上｝｛いじょう｝が｛必要｝｛ひつよう｝。

｛次｝｛つぎ｝のモジュール｛定義｝｛ていぎ｝とインポートを｛無視｝｛むし｝
する。

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

｛以下｝｛いか｝に｛答｝｛こた｝えを｛定義｝｛ていぎ｝せよ。

> eval :: String -> Float
> eval = undefined

テストのコマンド： `runTests evalTests`

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
