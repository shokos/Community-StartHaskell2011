｛再帰｝｛さいき｝の｛練習｝｛れんしゅう｝｛問題｝｛もんだい｝
==============================================================

｛再帰｝｛さいき｝｛関数｝｛かんすう｝の｛定義｝｛ていぎ｝を
｛練習｝｛れんしゅう｝するために、｛以下｝｛いか｝の`Prelude`で
｛定義｝｛ていぎ｝されている｛関数｝｛かんすう｝を｛再帰｝｛さいき｝を
｛用｝｛もち｝いて｛定義｝｛ていぎ｝せよ。（リスト｛内包｝｛ないほう｝
｛表記｝｛ひょうき｝と`map`と`foldr`などな｛高階関数｝｛こうかいかんすう｝を
｛使｝｛つか｝わずに｛定義｝｛ていぎ｝せよ。）

これらの｛練習｝｛れんしゅう｝｛問題｝｛もんだい｝は6｛個｝｛こ｝のセットに
｛分類｝｛ぶんるい｝されている。あるセットの｛問題｝｛もんだい｝を
｛混乱｝｛こんらん｝せずに｛早｝｛はや｝く｛解決｝｛かいけつ｝できれば、その
セットの｛残｝｛のこ｝りの｛問題｝｛もんだい｝を｛読｝｛よ｝み
｛飛｝｛と｝ばして、｛次｝｛つぎ｝のセットの｛問題｝｛もんだい｝をして
｛良｝｛よ｝い。

このファイルは｛文芸的｝｛ぶんげいてき｝プログラミングの｛形式｝｛けいしき｝で
｛書｝｛か｝いている。このファイルの｛中｝｛なか｝に｛関数｝｛かんすう｝を
｛定義｝｛ていぎ｝せよ。「GHC 7.0.3」｛以上｝｛いじょう｝が
｛必要｝｛ひつよう｝。｛例題｝｛れいだい｝：

    > factorial :: Int -> Int
    > factorial = undefined

｛問題｝｛もんだい｝を｛解決｝｛かいけつ｝するために、「`undefined`」の
｛行｝｛ぎょう｝を｛削除｝｛さくじょ｝して、｛定義｝｛ていぎ｝のコードの
｛各｝｛かく｝｛行｝｛ぎょう｝の｛先頭｝｛せんとう｝に「`>`」を
｛入｝｛い｝れる｛必要｝｛ひつよう｝：

    > factorial :: Int -> Int
    > factorial n | n >= 2    = factorial' 1 n
    >             | n >= 0    = 1
    >             | otherwise = error "factorial of negative"
    >   where
    >     factorial' :: Int -> Int -> Int
    >     factorial' acc n | n < 2     = acc
    >                      | otherwise = factorial' (acc * n) (n - 1)

｛次｝｛つぎ｝のモジュール｛定義｝｛ていぎ｝とインポートを｛無視｝｛むし｝
する。

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

HUnitのパッケージを｛使｝｛つか｝って、テストも｛付｝｛つ｝いている。
`cabal install hunit`のコマンドでコマンドラインからHUnitをインストールできる。
｛一｝｛ひと｝つの｛問題｝｛もんだい｝のテストを｛実行｝｛じっこう｝するには、
｛以下｝｛いか｝に｛定義｝｛ていぎ｝されている｛関数｝｛かんすう｝`runTests`を
｛使｝｛つか｝う。GHCiにコピー・アンド・ペーストするために、｛各｝｛かく｝
｛問題｝｛もんだい｝のコマンドを｛用意｝｛ようい｝してある。

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

｛複数｝｛ふくすう｝の｛問題｝｛もんだい｝のテストを｛実行｝｛じっこう｝する
ために｛以下｝｛いか｝の｛定義｝｛ていぎ｝`tests`を｛使｝｛つか｝える。
｛実行｝｛じっこう｝したいテストを｛非｝｛ひ｝コメント｛化｝｛か｝せよ。

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

`tests`のテストを｛実行｝｛じっこう｝するには`main`を｛使｝｛つか｝う。

> main :: IO Counts
> main = runTests $ Prelude.concat tests

｛次｝｛つぎ｝の｛定義｝｛ていぎ｝を｛無視｝｛むし｝する。

> assertError :: String -> a -> Assertion
> assertError msg x = handleJust errorCalls (const $ return ()) $ do
>     evaluate x
>     assertFailure $ msg Prelude.++ ": error not thrown"
>   where
>     errorCalls (ErrorCall _) = Just ()

テストのいくつかを｛実行｝｛じっこう｝する｛時｝｛とき｝に、
｛時間｝｛じかん｝がかかるが、｛正｝｛ただ｝しく｛定義｝｛ていぎ｝されている
｛問題｝｛もんだい｝は｛沢山｝｛たくさん｝メモリが｛必要｝｛ひつよう｝ない。
｛以下｝｛いか｝の｛定数｝｛ていすう｝を｛変更｝｛へんこう｝すると、テストの
サイズを｛変更｝｛へんこう｝できる。

> large :: Int
> large = 2 ^ 24

セット1
-------

1. [(++)](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:-43--43-)

> (++) :: [a] -> [a] -> [a]
> (++) = undefined

テストのコマンド： `runTests appendTests`

> appendTests :: [Test]
> appendTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "[1,2] ++ [3,4]" ([1,2] ++ [3,4]) [1,2,3,4]
>   , assertEqual "[] ++ [1,2]" ([] ++ [1,2]) [1,2]
>   , assertEqual "[1,2] ++ []" ([1,2] ++ []) [1,2]
>   , assertEqual "[] ++ []" ([] ++ []) ([] :: [Int])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 3 (cycle [1,2] ++ [3,4])"
>                 (Prelude.take 3 (cycle [1,2] ++ [3,4])) [1,2,1]
>   , assertEqual "take 3 ([1,2] ++ (cycle [3,4]))"
>                 (Prelude.take 3 ([1,2] ++ (cycle [3,4]))) [1,2,3]
>   ]

2. [concat](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:concat)

> concat :: [[a]] -> [a]
> concat = undefined

テストのコマンド： `runTests concatTests`

> concatTests :: [Test]
> concatTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "concat [[1,2],[3],[]]" (concat [[1,2],[3],[]]) [1,2,3]
>   , assertEqual "concat [[1],[2,3],[]]" (concat [[1],[2,3],[]]) [1,2,3]
>   , assertEqual "concat [[],[1],[2,3]]" (concat [[],[1],[2,3]]) [1,2,3]
>   , assertEqual "concat []" (concat []) ([] :: [Int])
>   , assertEqual "concat [[]]" (concat [[]]) ([] :: [Int])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 5 (concat [[1,2], cycle [3,4], []])"
>                 (Prelude.take 5 (concat [[1,2], cycle [3,4], []])) [1,2,3,4,3]
>   ]

3. [map](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:map)

> map :: (a -> b) -> [a] -> [b]
> map = undefined

テストのコマンド： `runTests mapTests`

> mapTests :: [Test]
> mapTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "map (\\x -> x + 1) [1,2,3]"
>                 (map (\x -> x + 1) [1,2,3]) [2,3,4]
>   , assertEqual "map (\\x -> x + 1) []" (map (\x -> x + 1) []) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 5 (map (\\x -> x + 1) [1..])"
>                 (Prelude.take 5 (map (\x -> x + 1) [1..])) [2,3,4,5,6]
>   ]

4. [concatMap](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:concatMap)

> concatMap :: (a -> [b]) -> [a] -> [b]
> concatMap = undefined

テストのコマンド： `runTests concatMapTests`

> concatMapTests :: [Test]
> concatMapTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "concatMap (\\x -> [x, -x]) [1,2]"
>                 (concatMap (\x -> [x, -x]) [1,2]) [1,-1,2,-2]
>   , assertEqual "concatMap (\\x -> [x, -x]) []"
>                 (concatMap (\x -> [x, -x]) []) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 3 (concatMap (\\x -> [x, -x])"
>                 (Prelude.take 3 (concatMap (\x -> [x, -x]) [1..])) [1,-1,2]
>   ]

5. [filter](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:filter)

> filter :: (a -> Bool) -> [a] -> [a]
> filter = undefined

テストのコマンド： `runTests filterTests`

> filterTests :: [Test]
> filterTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "filter even [1,2,3,4]" (filter even [1,2,3,4]) [2,4]
>   , assertEqual "filter even [1,3,5]" (filter even [1,3,5]) []
>   , assertEqual "filter even []" (filter even []) ([] :: [Int])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 5 (filter even [1..])"
>                 (Prelude.take 5 (filter even [1..])) [2,4,6,8,10]
>   ]

6. [until](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:until)

> until :: (a -> Bool) -> (a -> a) -> a -> a
> until = undefined

テストのコマンド： `runTests untilTests`

> untilTests :: [Test]
> untilTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "until (<= 1.0) (/ 2) 100.0"
>                 (until (<= 1.0) (/ 2) 100.0) 0.78125
>   ]

7. [and](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:and)

> and :: [Bool] -> Bool
> and = undefined

テストのコマンド： `runTests andTests`

> andTests :: [Test]
> andTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "and [True,True,True]" (and [True,True,True]) True
>   , assertEqual "and [True,False,True]" (and [True,False,True]) False
>   , assertEqual "and []" (and []) True
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "and (cycle [True,False])" (and (cycle [True,False])) False
>   , assertEqual "and (replicate (2 ^ 24) True)"
>                 (and (replicate (2 ^ 24) True)) True
>   ]

8. [or](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:or)

> or :: [Bool] -> Bool
> or = undefined

テストのコマンド： `runTests orTests`

> orTests :: [Test]
> orTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "or [False,True,False]" (or [False,True,False]) True
>   , assertEqual "or [False,False,False]" (or [False,False,False]) False
>   , assertEqual "or []" (or []) False
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "or (cycle [False,True])" (or (cycle [False,True])) True
>   , assertEqual "or (replicate (2 ^ 24) False)"
>                 (or (replicate (2 ^ 24) False)) False
>   ]

9. [any](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:any)

> any :: (a -> Bool) -> [a] -> Bool
> any = undefined

テストのコマンド： `runTests anyTests`

> anyTests :: [Test]
> anyTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "any even [1,2,3]" (any even [1,2,3]) True
>   , assertEqual "any even [1,3,5]" (any even [1,3,5]) False
>   , assertEqual "any even []" (any even []) False
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "any even [1..]" (any even [1..]) True
>   , assertEqual "any even [2 * x + 1 | x <- [1..large]]"
>                 (any even [2 * x + 1 | x <- [1..large]]) False
>   ]

10. [all](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:all)

> all :: (a -> Bool) -> [a] -> Bool
> all = undefined

テストのコマンド： `runTests allTests`

> allTests :: [Test]
> allTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "all even [2,4,6]" (all even [2,4,6]) True
>   , assertEqual "all even [2,5,7]" (all even [2,5,7]) False
>   , assertEqual "all even []" (all even []) True
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "all even [1..]" (all even [1..]) False
>   , assertEqual "all even [2 * x | x <- [1..large]]"
>                 (all even [2 * x | x <- [1..large]]) True
>   ]

11. [elem](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:elem)

> elem :: Eq a => a -> [a] -> Bool
> elem = undefined

テストのコマンド： `runTests elemTests`

> elemTests :: [Test]
> elemTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "2 `elem` [1,2,3]" (2 `elem` [1,2,3]) True
>   , assertEqual "4 `elem` [1,2,3]" (4 `elem` [1,2,3]) False
>   , assertEqual "1 `elem` []" (1 `elem` []) False
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "1331 `elem` [1..]" (1331 `elem` [1..]) True
>   , assertEqual "1331 `elem` [2 * x | x <- [1..large]]"
>                 (1331 `elem` [2 * x | x <- [1..large]]) False
>   ]

12. [notElem](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:notElem)

> notElem :: Eq a => a -> [a] -> Bool
> notElem = undefined

テストのコマンド： `runTests notElemTests`

> notElemTests :: [Test]
> notElemTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "2 `notElem` [1,2,3]" (2 `notElem` [1,2,3]) False
>   , assertEqual "4 `notElem` [1,2,3]" (4 `notElem` [1,2,3]) True
>   , assertEqual "1 `notElem` []" (1 `notElem` []) True
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "1331 `notElem` [1..]" (1331 `notElem` [1..]) False
>   , assertEqual "1331 `notElem` [2 * x | x <- [1..large]]"
>                 (1331 `notElem` [2 * x | x <- [1..large]]) True
>   ]

13. [zip](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zip)

> zip :: [a] -> [b] -> [(a, b)]
> zip = undefined

テストのコマンド： `runTests zipTests`

> zipTests :: [Test]
> zipTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "zip \"abc\" [1,2,3]"
>                 (zip "abc" [1,2,3]) [('a',1),('b',2),('c',3)]
>   , assertEqual "zip \"abc\" [1,2]"
>                 (zip "abc" [1,2]) [('a',1),('b',2)]
>   , assertEqual "zip \"ab\" [1,2,3]"
>                 (zip "ab" [1,2,3]) [('a',1),('b',2)]
>   , assertEqual "zip \"abc\" []"
>                 (zip "abc" []) ([] :: [(Char, Int)])
>   , assertEqual "zip \"\" [1,2,3]" (zip "" [1,2,3]) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
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

テストのコマンド： `runTests zip3Tests`

> zip3Tests :: [Test]
> zip3Tests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
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
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
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

テストのコマンド： `runTests zipWithTests`

> zipWithTests :: [Test]
> zipWithTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "zipWith (+) [1,2,3] [4,5,6]"
>                 (zipWith (+) [1,2,3] [4,5,6]) [5,7,9]
>   , assertEqual "zipWith (+) [1,2,3] [4,5]"
>                 (zipWith (+) [1,2,3] [4,5]) [5,7]
>   , assertEqual "zipWith (+) [1,2] [4,5,6]"
>                 (zipWith (+) [1,2] [4,5,6]) [5,7]
>   , assertEqual "zipWith (+) [] []"
>                 (zipWith (+) [] []) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "zipWith (+) [1,2,3] (cycle [1,0])"
>                 (zipWith (+) [1,2,3] (cycle [1,0])) [2,2,4]
>   , assertEqual "take 3 (zipWith (+) [1..] (cycle [1,0]))"
>                 (Prelude.take 3 (zipWith (+) [1..] (cycle [1,0]))) [2,2,4]
>   ]

16. [zipWith3](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:zipWith3)

> zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
> zipWith3 = undefined

テストのコマンド： `runTests zipWith3Tests`

> zipWith3Tests :: [Test]
> zipWith3Tests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
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
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
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

｛簡単｝｛かんたん｝にするために、プラットフォームにかかわらず、
｛改行｝｛かいぎょう｝コードを`'\n'`にする。

> unlines :: [String] -> String
> unlines = undefined

テストのコマンド： `runTests unlinesTests`

> unlinesTests :: [Test]
> unlinesTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "unlines [\"one\",\"two\",\"three\"]"
>                 (unlines ["one","two","three"])
>                 "one\ntwo\nthree\n"
>   , assertEqual "unlines [\"one\"]" (unlines ["one"]) "one\n"
>   , assertEqual "unlines []" (unlines []) ""
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 16 (unlines (cycle [\"one\", \"two\"]))"
>                 (Prelude.take 16 (unlines (cycle ["one", "two"])))
>                 "one\ntwo\none\ntwo\n"
>   ]

18. [unwords](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unwords)

> unwords :: [String] -> String
> unwords = undefined

テストのコマンド： `runTests unwordsTests`

> unwordsTests :: [Test]
> unwordsTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "unwords [\"one\",\"two\",\"three\"]"
>                 (unwords ["one","two","three"])
>                 "one two three"
>   , assertEqual "unwords [\"one\"]" (unwords ["one"]) "one"
>   , assertEqual "unwords []" (unwords []) ""
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "take 15 (unwords (cycle [\"one\", \"two\"]))"
>                 (Prelude.take 15 (unwords (cycle ["one", "two"])))
>                 "one two one two"
>   ]

セット2
-------

19. [last](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:last)

> last :: [a] -> a
> last = undefined

テストのコマンド： `runTests lastTests`

> lastTests :: [Test]
> lastTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "last [1,2,3]" (last [1,2,3]) 3
>   , assertError "last []" (last [])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "last [1..large]" (last [1..large]) large
>   ]

20. [init](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:init)

> init :: [a] -> [a]
> init = undefined

テストのコマンド： `runTests initTests`

> initTests :: [Test]
> initTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "init [1,2,3]" (init [1,2,3]) [1,2]
>   , assertError "init []" (init [])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (init [1..])" (head (init [1..])) 1
>   ]

21. [take](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:take)

> take :: Int -> [a] -> [a]
> take = undefined

テストのコマンド： `runTests takeTests`

> takeTests :: [Test]
> takeTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "take 2 [1,2,3]" (take 2 [1,2,3]) [1,2]
>   , assertEqual "take 0 [1,2,3]" (take 0 [1,2,3]) []
>   , assertEqual "take 4 [1,2,3]" (take 4 [1,2,3]) [1,2,3]
>   , assertEqual "take (-1) [1,2,3]" (take (-1) [1,2,3]) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (take large [1..])" (head (take large [1..])) 1
>   ]

22. [drop](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:drop)

> drop :: Int -> [a] -> [a]
> drop = undefined

テストのコマンド： `runTests dropTests`

> dropTests :: [Test]
> dropTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "drop 2 [1,2,3]" (drop 2 [1,2,3]) [3]
>   , assertEqual "drop 0 [1,2,3]" (drop 0 [1,2,3]) [1,2,3]
>   , assertEqual "drop 5 [1,2,3]" (drop 4 [1,2,3]) []
>   , assertEqual "drop (-1) [1,2,3]" (drop (-1) [1,2,3]) [1,2,3]
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (drop 3 [1..])" (head (drop 3 [1..])) 4
>   ]

23. [takeWhile](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:takeWhile)

> takeWhile :: (a -> Bool) -> [a] -> [a]
> takeWhile = undefined

テストのコマンド： `runTests takeWhileTests`

> takeWhileTests :: [Test]
> takeWhileTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "takeWhile even [2,4,5,6]" (takeWhile even [2,4,5,6]) [2,4]
>   , assertEqual "takeWhile even [1,2,3]" (takeWhile even [1,2,3]) []
>   , assertEqual "takeWhile even [2,4,6]" (takeWhile even [2,4,6]) [2,4,6]
>   , assertEqual "takeWhile even []" (takeWhile even []) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (takeWhile (> 0) [1..])"
>                 (head (takeWhile (> 0) [1..]))
>                 1
>   ]

24. [dropWhile](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:dropWhile)

> dropWhile :: (a -> Bool) -> [a] -> [a]
> dropWhile = undefined

テストのコマンド： `runTests dropWhileTests`

> dropWhileTests :: [Test]
> dropWhileTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "dropWhile even [2,4,5,6]" (dropWhile even [2,4,5,6]) [5,6]
>   , assertEqual "dropWhile even [1,2,3]" (dropWhile even [1,2,3]) [1,2,3]
>   , assertEqual "dropWhile even [2,4,6]" (dropWhile even [2,4,6]) []
>   , assertEqual "dropWhile even []" (dropWhile even []) []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (dropWhile even (cycle [2,4,6,9]))"
>                 (head (dropWhile even (cycle [2,4,6,9])))
>                 9
>   ]

セット3
-------

25. [(!!)](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:-33--33-)

> (!!) :: [a] -> Int -> a
> (!!) = undefined

テストのコマンド： `runTests indexTests`

> indexTests :: [Test]
> indexTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "[1,2,3] !! 0" ([1,2,3] !! 0) 1
>   , assertEqual "[1,2,3] !! 1" ([1,2,3] !! 1) 2
>   , assertEqual "[1,2,3] !! 2" ([1,2,3] !! 2) 3
>   , assertError "[1,2,3] !! (-1)" ([1,2,3] !! (-1))
>   , assertError "[1,2,3] !! 3" ([1,2,3] !! 3)
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "[1..] !! large" ([0..] !! large) large
>   ]

セット4
-------

このセットの｛問題｝｛もんだい｝には、アキュムレータを｛用｝｛もち｝いて
｛定義｝｛ていぎ｝せよ。

26. [sum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:sum)

> sum :: Num a => [a] -> a
> sum = undefined

テストのコマンド： `runTests sumTests`

> sumTests :: [Test]
> sumTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "sum [1,2,3,4]" (sum [1,2,3,4]) 10
>   , assertEqual "sum [1,-1,2,-2]" (sum [1,-1,2,-2]) 0
>   , assertEqual "sum []" (sum []) 0
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト - ｛末尾再帰｝｛まつびさいき｝が｛必要｝｛ひつよう｝です
>   --, assertEqual "sum (concatMap (\\n -> [n,-n]) [1..large])"
>   --              (sum (Prelude.concatMap (\n -> [n,-n]) [1..large]))
>   --              0
>   ]

27. [product](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:product)

> product :: Num a => [a] -> a
> product = undefined

テストのコマンド： `runTests productTests`

> productTests :: [Test]
> productTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "product [1,2,3,4]" (product [1,2,3,4]) 24
>   , assertEqual "product [1,-1,2,-2]" (product [1,-1,2,-2]) 4
>   , assertEqual "product [0,1,2]" (product [0,1,2]) 0
>   , assertEqual "product []" (product []) 1
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト - ｛末尾再帰｝｛まつびさいき｝が｛必要｝｛ひつよう｝です
>   --, assertEqual
>   --    "product (concatMap (\\n -> let n2 = 2*n in [n2,1/n2]) [1..large])"
>   --    (product (concatMap (\n -> let n2 = 2*n in [n2,1/n2]) [1..large]))
>   --    1.0
>   ]

28. [maximum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:maximum)

> maximum :: Ord a => [a] -> a
> maximum = undefined

テストのコマンド： `runTests maximumTests`

> maximumTests :: [Test]
> maximumTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "maximum [1,5,9,3,7]" (maximum [1,5,9,3,7]) 9
>   , assertError "maximum []" (maximum ([] :: [Int]))
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "maximum [1..large]" (maximum [1..large]) large
>   ]

29. [minimum](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:minimum)

> minimum :: Ord a => [a] -> a
> minimum = undefined

テストのコマンド： `runTests minimumTests`

> minimumTests :: [Test]
> minimumTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "minimum [1,5,9,3,7]" (minimum [9,5,1,7,3]) 1
>   , assertError "minimum []" (minimum ([] :: [Int]))
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "minimum [1..large]" (minimum [1..large]) 1
>   ]

30. [length](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:length)

> length :: [a] -> Int
> length = undefined

テストのコマンド： `runTests lengthTests`

> lengthTests :: [Test]
> lengthTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "length [1,2,3]" (length [1,2,3]) 3
>   , assertEqual "length []" (length []) 0
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト - ｛末尾再帰｝｛まつびさいき｝が｛必要｝｛ひつよう｝です
>   --, assertEqual "length [1..large]" (length [1..large]) large
>   ]

31. [reverse](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:reverse)

> reverse :: [a] -> [a]
> reverse = undefined

テストのコマンド： `runTests reverseTests`

> reverseTests :: [Test]
> reverseTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "reverse [1,2,3]" (reverse [1,2,3]) [3,2,1]
>   , assertEqual "reverse []" (reverse []) ([] :: [Int])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (reverse [1..large])"
>                 (head (reverse [1..large]))
>                 large
>   ]

32. [lines](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:lines)

｛簡単｝｛かんたん｝にするために、プラットフォームにかかわらず、
｛改行｝｛かいぎょう｝コードを`'\n'`にする。

> lines :: String -> [String]
> lines = undefined

テストのコマンド： `runTests linesTests`

> linesTests :: [Test]
> linesTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "lines \"one\\ntwo\\nthree\\n\""
>                 (lines "one\ntwo\nthree\n")
>                 ["one","two","three"]
>   , assertEqual "lines \"\\n\\none\\n\\ntwo\\n\\nthree\\n\\n\""
>                 (lines "\n\none\n\ntwo\n\nthree\n\n")
>                 ["","","one","","two","","three",""]
>   , assertEqual "lines \"\\n\"" (lines "\n") [""]
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (lines (concat (repeat \"one\\n\")))"
>                 (head (lines (Prelude.concat (repeat "one\n"))))
>                 "one"
>   ]

33. [words](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:words)

`Data.Char`で｛定義｝｛ていぎ｝されている｛関数｝｛かんすう｝`isSpace`を
｛使｝｛つか｝うと｛良｝｛よ｝い。

> words :: String -> [String]
> words = undefined

テストのコマンド： `runTests wordsTests`

> wordsTests :: [Test]
> wordsTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "words \"one two three\""
>                 (words "one two three")
>                 ["one","two","three"]
>   , assertEqual "words \" one\\ttwo\\nthree \""
>                 (words " one\ttwo\nthree ")
>                 ["one","two","three"]
>   , assertEqual "words \"i\\n \\t\\n\\n\\t \"" (words "\n \t\n\n\t ") []
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (words (concat (repeat \" one\")))"
>                 (head (words (Prelude.concat (repeat " one"))))
>                 "one"
>   ]

セット5
-------

34. [splitAt](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:splitAt)

> splitAt :: Int -> [a] -> ([a], [a])
> splitAt = undefined

テストのコマンド： `runTests splitAtTests`

> splitAtTests :: [Test]
> splitAtTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "splitAt 1 [1,2,3]" (splitAt 1 [1,2,3]) ([1],[2,3])
>   , assertEqual "splitAt 0 [1,2,3]" (splitAt 0 [1,2,3]) ([],[1,2,3])
>   , assertEqual "splitAt 4 [1,2,3]" (splitAt 4 [1,2,3]) ([1,2,3],[])
>   , assertEqual "splitAt (-1) [1,2,3]" (splitAt (-1) [1,2,3]) ([],[1,2,3])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (fst (splitAt large [1..]))"
>                 (head (fst (splitAt large [1..])))
>                 1
>   ]

35. [span](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:span)

> span :: (a -> Bool) -> [a] -> ([a], [a])
> span = undefined

テストのコマンド： `runTests spanTests`

> spanTests :: [Test]
> spanTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "span even [2,4,6,9]" (span even [2,4,6,9]) ([2,4,6],[9])
>   , assertEqual "span even [1,3,5,8]" (span even [1,3,5,8]) ([],[1,3,5,8])
>   , assertEqual "span even []" (span even []) ([],[])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (fst (span (> 0) [1..]))"
>                 (head (fst (span (> 0) [1..])))
>                 1
>   ]

36. [break](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:break)

> break :: (a -> Bool) -> [a] -> ([a], [a])
> break = undefined

テストのコマンド： `runTests breakTests`

> breakTests :: [Test]
> breakTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "break even [1,3,6,8]" (break even [1,3,6,8]) ([1,3],[6,8])
>   , assertEqual "break even [2,4,7,9]" (break even [2,4,7,9]) ([],[2,4,7,9])
>   , assertEqual "break even []" (break even []) ([],[])
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (fst (break (< 0) [1..]))"
>                 (head (fst (break (< 0) [1..])))
>                 1
>   ]

37. [unzip](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unzip)

> unzip :: [(a, b)] -> ([a], [b])
> unzip = undefined

テストのコマンド： `runTests unzipTests`

> unzipTests :: [Test]
> unzipTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "unzip [(1,'a'),(2,'b'),(3,'c')]"
>                 (unzip [(1,'a'),(2,'b'),(3,'c')])
>                 ([1,2,3],"abc")
>   , assertEqual "unzip []" (unzip []) (([],[]) :: ([Int],[Char]))
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head (fst (unzip [(x,x) | x <- [1..]]))"
>                 (head (fst (unzip [(x,x) | x <- [1..]])))
>                 1
>   ]

38. [unzip3](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:unzip3)

> unzip3 :: [(a, b, c)] -> ([a], [b], [c])
> unzip3 = undefined

テストのコマンド： `runTests unzip3Tests`

> unzip3Tests :: [Test]
> unzip3Tests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "unzip3 [(1,'a',True),(2,'b',False),(3,'c',True)]"
>                 (unzip3 [(1,'a',True),(2,'b',False),(3,'c',True)])
>                 ([1,2,3],"abc",[True,False,True])
>   , assertEqual "unzip3 []" (unzip3 []) (([],[],[]) :: ([Int],[Char],[Int]))
>   -- ｛無限｝｛むげん｝／｛大｝｛おお｝きなテスト
>   , assertEqual "head ((\\(x,y,z) -> x) (unzip3 [(x,x,x) | x <- [1..]]))"
>                 (head ((\(x,y,z) -> x) (unzip3 [(x,x,x) | x <- [1..]])))
>                 1
>   ]

セット6
-------

39. [foldl](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:foldl)

> foldl :: (a -> b -> a) -> a -> [b] -> a
> foldl = undefined

テストのコマンド： `runTests foldlTests`

> foldlTests :: [Test]
> foldlTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "foldl (+) 0 [1,2,3]" (foldl (+) 0 [1,2,3]) 6
>   , assertEqual "foldl (+) 0 []" (foldl (+) 0 []) 0
>   , assertEqual "foldl (/) 1 [4,2,1]" (foldl (/) 1 [4,2,1]) 0.125
>   ]

40. [foldr](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:foldr)

> foldr :: (a -> b -> b) -> b -> [a] -> b
> foldr = undefined

テストのコマンド： `runTests foldrTests`

> foldrTests :: [Test]
> foldrTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "foldr (+) 0 [1,2,3]" (foldr (+) 0 [1,2,3]) 6
>   , assertEqual "foldr (+) 0 []" (foldr (+) 0 []) 0
>   , assertEqual "foldr (/) 1 [4,2,1]" (foldr (/) 1 [4,2,1]) 2
>   ]

41. [scanl](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:scanl)

> scanl :: (a -> b -> a) -> a -> [b] -> [a]
> scanl = undefined

テストのコマンド： `runTests scanlTests`

> scanlTests :: [Test]
> scanlTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "scanl (+) 0 [1,2,3]" (scanl (+) 0 [1,2,3]) [0,1,3,6]
>   , assertEqual "scanl (+) 0 []" (scanl (+) 0 []) [0]
>   , assertEqual "scanl (/) 1 [4,2,1]"
>                 (scanl (/) 1 [4,2,1])
>                 [1,0.25,0.125,0.125]
>   ]

42. [scanr](http://haskell.org/ghc/docs/7.0-latest/html/libraries/base-4.3.1.0/Prelude.html#v:scanr)

> scanr :: (a -> b -> b) -> b -> [a] -> [b]
> scanr = undefined

テストのコマンド： `runTests scanrTests`

> scanrTests :: [Test]
> scanrTests = Prelude.map TestCase
>   -- ｛基本｝｛きほん｝のテスト
>   [ assertEqual "scanr (+) 0 [1,2,3]" (scanr (+) 0 [1,2,3]) [6,5,3,0]
>   , assertEqual "scanr (+) 0 []" (scanr (+) 0 []) [0]
>   , assertEqual "scanr (/) 1 [4,2,1]"
>                 (scanr (/) 1 [4,2,1])
>                 [2,2,1,1]
>   ]
