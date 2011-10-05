「プログラミングHaskell」：｛第｝｛だい｝8｛章｝｛しょう｝：｛問題｝｛もんだい｝1
=================================================================================

このファイルは｛文芸的｝｛ぶんげいてき｝プログラミングの｛形式｝｛けいしき｝で
｛書｝｛か｝いている。このファイルの｛中｝｛なか｝に｛関数｝｛かんすう｝を
｛定義｝｛ていぎ｝して、｛含｝｛ふく｝まれているテストで
｛確認｝｛かくにん｝せよ。

｛次｝｛つぎ｝のモジュール｛定義｝｛ていぎ｝とインポートを｛無視｝｛むし｝
する。

> module Main (main) where
>
> -- hunit
> import Test.HUnit
>
> -- local
> import Parsing

｛以下｝｛いか｝に｛答｝｛こた｝えを｛定義｝｛ていぎ｝せよ。

> myInt :: Parser Int
> myInt = undefined

テストのコマンド： `runTests myIntTests`

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
