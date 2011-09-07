補足演習問題：第4章
===================

_プログラミングHaskell_の第4章のための補足演習問題です。本にある演習問題
（ページ43、44）を最初に解決してください。

問題7
-----

何で以下のが無効ですか？

    if 1 then 'a' else 'b'

問題8
-----

何で以下のが無効ですか？

    if True then 1 else 'b'

問題9
-----

`(:)`という*cons演算子*は既存のリストの先頭に新しい要素を追加します。`(++)`
という*連結演算子*は二つのリストを連結します。GHCiで`:t (:)`と`:t (++)`を
使って、これらの関数の型を確認してください。

これらの関数を理解するのを確認するために、すべての引数の値を順番にして、
リストを作る関数を実装してください：

    hoge :: a -> [a] -> a -> [a] -> [a] -> (a, a) -> [a]

以下の使用例を示してください。

    > hoge 1 [2,3] 4 [5] [6,7] (8,9)
    [1,2,3,4,5,6,7,8,9]
    > hoge 1 [] 2 [] [] (3,4)
    [1,2,3,4]

問題10
------

`Data.List`モジュールに定義されている`isPrefixOf`関数はあるリストが他の
リストの開始部分に一致するかを検査します：

    isPrefixOf :: Eq a => [a]   -- リスト1
                       -> [a]   -- リスト2
                       -> Bool  -- リスト2の開始がリスト1？

第2章で紹介した関数を使って、`isPrefixOf`を実装してください。

同じように`isSuffixOf`を実装してください。

    isSuffixOf :: Eq a => [a]   -- リスト1
                       -> [a]   -- リスト2
                       -> Bool  -- リスト2の終了がリスト1？

以下の使用例を示してください。

    > [1,2] `isPrefixOf` [1,2,3,4]
    True
    > [3,4] `isSuffixOf` [1,2,3,4]
    True
    > [4] `isPrefixOf` [1,2,3,4]
    False
    > [1] `isSuffixOf` [1,2,3,4]
    False
    > [] `isPrefixOf` [1,2,3,4]
    True
    > [] `isSuffixOf` [1,2,3,4]
    True
    > [1] `isPrefixOf` []
    False
    > [1] `isSuffixOf` []
    False

問題11
------

パターンマッチを使って、`nand`と`nor`という基準ブール演算を実装してください。
好きな方法で`xor`という基準ブール演算を実装してください。この関数だけで、
`fullAdder`という全加算器の関数を定義してください。

    fullAdder :: Bool          -- 入力A
              -> Bool          -- 入力B
              -> Bool          -- 桁上げ入力
              -> (Bool, Bool)  -- (出力, 桁上げ出力)

http://ja.wikipedia.org/wiki/加算器

以下の使用例を示してください。

    > fullAdder False False False
    (False, False)
    > fullAdder False True False
    (True, False)
    > fullAdder True True False
    (False, True)
    > fullAdder False False True
    (True, False)
    > fullAdder True False True
    (False, True)
    > fullAdder True True True
    (True, True)

問題12
------

以下の関数をラムダ関数に帰す引数ではないものに定義してください。

    lenCMtoIN :: Float -> Float
    lenCMtoIN cm = cm / 2.54

以下の使用例を示してください。

    > lenCMtoIN 2.54
    1.0
    > lenCMtoIN 1
    0.39370078740157477

問題13
------

以下の関数をラムダ関数に帰す引数ではないものに定義してください。

    average :: Float -> Float -> Float
    average x y = (x + y) / 2

以下の使用例を示してください。

    > average 1 10
    5.5
    > average 2 4
    3.0

問題14
------

以下の関数をラムダ関数に帰す引数ではないものに定義してください。

    bound :: (Int, Int) -> Int -> Int
    bound (low, high) x | x < low   = low
                        | x > high  = high
                        | otherwise = x

以下の使用例を示してください。

    > bound (0,100) 101
    100
    > bound (32,212) 20
    32
    > bound (0,100) 99
    99

問題15
------

ラムダ関数の代わりにセクションを使って、`lenCMtoIN`を定義してください。

以下の使用例を示してください。

    > lenCMtoIN 2.54
    1.0
    > lenCMtoIN 1
    0.39370078740157477

問題16
------

以下のコードはピタゴラスの定理で直角三角形の斜辺の長さを計算する命令型
プログラミングの擬似コード（別名Python）です。Haskell版を書いてください。

    # 直角三角形の斜辺の長さを計算する
    def pythag(a, b):
        return sqrt(a * a + b * b)

*Prelude*で定義されている`sqrt :: Floating a => a -> a`関数を使えます。

以下の使用例を示してください。

    > pythag 3 4
    5.0
    > pythag 10 10
    14.142135623730951

問題17
------

以下のコードはビネの式でフィボナッチ数を計算する命令型プログラミングの擬似
コード（別名Python）です。`fib :: Int -> Int`というHaskell版を書いてください。

    # n番目のフィボナッチ数を計算する
    def fib(n):
        root5 = sqrt(5)
        return round(((1 + root5) ** n - (1 - root5) ** n) / (2 ** n * root5))

*Prelude*で定義されている`fromIntegral`と`round`という*Int*と*Float*の値を
変換する関数を使えます。

以下の使用例を示してください。

    > fib 1
    1
    > fib 2
    1
    > fib 3
    2
    > fib 4
    3
    > fib 5
    5
    > fib 20
    6765
