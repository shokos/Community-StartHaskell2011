再帰関数（補足）
================

A-Intro-01-Title
----------------

再帰関数（補足）

トラビス・カードウェル

2011年9月11日

A-Intro-02-Overview
-------------------

「プログラミングHaskell」の第6章の補足です。

二つの例で再帰関数についてもう少し教えます。

* `factorial`
* `reverse`

B-Factorial-01-Book
-------------------

本に定義している関数（ページ57）：

    factorial :: Int -> Int
    factorial 0       = 1
    factorial (n + 1) = (n + 1) * factorial n

> Haskellから廃止された「n+kパターン」を使っています。このまま実行してみると
> エラーが出ます。

B-Factorial-02-NoNPlusK
-----------------------

Haskellから廃止された「n+kパターン」を使わないように変換します。

    factorial :: Int -> Int
    factorial 0 = 1
    factorial n = n * factorial (n - 1)

B-Factorial-03-Partial-Question
-------------------------------

`factorial`に負数を渡したら、何が起こりますか？

    factorial :: Int -> Int
    factorial 0 = 1
    factorial n = n * factorial (n - 1)

B-Factorial-04-Partial-Answer
-------------------------------

`factorial`に負数を渡したら、何が起こりますか？

無限ループに入ってしまいます。

正当な入力の部分集合の値に対して値を返さない関数は「部分関数」と言います。

B-Factorial-05-Partial-Error
----------------------------

終了しない関数は危ないです。この場合は`error`を使った方が良いです。

    factorial :: Int -> Int
    factorial 0             = 1
    factorial n | n > 0     = n * factorial (n - 1)
                | otherwise = error "factorial of negative"

B-Factorial-06-Reorder
----------------------

定義の条件の順番はパフォーマンスに影響を与えます。頻繁に実行される条件を上に
した方が良いです。

    factorial :: Int -> Int
    factorial n | n > 0     = n * factorial (n - 1)
                | n == 0    = 1
                | otherwise = error "factorial of negative"

> 大体、再帰する条件を上にします。

C-Reverse-01-Book
-----------------

本に定義している関数（ページ60）：

    reverse :: [a] -> [a]
    reverse []     = []
    reverse (x:xs) = reverse xs ++ [x]

これは遅い方法です。

> 理由を理解するためにリストについて考える必要があります。

C-Reverse-02-Lists-Structure
----------------------------

Haskellのリストは連結リストです。

    s0 = "hat"

     s0
     ↓
    [↓|→[↓|→[↓|ヌル]
    [h] [a] [t]

> 永続データ構造です。

C-Reverse-03-Lists-Cons
-----------------------

Haskellのリストは連結リストです。

    s0 = "hat"
    s1 = 't' : s0

     s1  s0
     ↓   ↓
    [↓|→[↓|→[↓|→[↓|ヌル]
    [t] [h] [a] [t]

> 「cons」（`(:)`）は早いです。
> リストをコピーする必要がないからです。

C-Reverse-04-Lists-Tail
-----------------------

Haskellのリストは連結リストです。

    s0 = "hat"
    s1 = 't' : s0
    s2 = tail s0

     s1  s0  s2
     ↓   ↓   ↓
    [↓|→[↓|→[↓|→[↓|ヌル]
    [t] [h] [a] [t]

> `tail`も早いです。
> リストをコピーする必要がないからです。

C-Reverse-05-Lists-Append-1
---------------------------

    s3 = s0 ++ ['s']

         s3
         ↓
     s1  s0  s2
     ↓   ↓   ↓
    [↓|→[↓|→[↓|→[↓|→[↓|ヌル]
    [t] [h] [a] [t] [s]

後ろに追加したら、`s0`と`s1`と`s2`の値が変更されてしまいます。なので、これは
できません。

C-Reverse-06-Lists-Append-2
---------------------------

    s3 = s0 ++ ['s']

     s1  s0  s2
     ↓   ↓   ↓
    [↓|→[↓|→[↓|→[↓|ヌル]
    [t] [h] [a] [t]

     s3
     ↓
    [↓|→[↓|→[↓|→[↓|ヌル]
    [h] [a] [t] [s]

変更しないように、リストをコピーする必要があります。

> `(++)`を使う時、注意が必要です。

C-Reverse-07-Slow
-----------------

各ステップでリストをコピーしてしまいます。

    reverse :: [a] -> [a]
    reverse []     = []
    reverse (x:xs) = reverse xs ++ [x]

C-Reverse-08-Fix
----------------

こういう方法で解決できます。

    reverse :: [a] -> [a]
    reverse lst = reverse' [] lst
      where
        reverse' :: [a] -> [a] -> [a]
        reverse' acc (x:xs) = reverse' (x : acc) xs
        reverse' acc []     = acc

* `reverse'` ← 「ヘルパー関数」
* `acc` ← アキュミュレイター

> `(:)`だけ使うので早いです。

C-Reverse-09-Final
------------------

最終版：

    reverse :: [a] -> [a]
    reverse = reverse' []
      where
        reverse' :: [a] -> [a] -> [a]
        reverse' acc (x:xs) = reverse' (x : acc) xs
        reverse' acc _      = acc

> カリー化のおかげで`lst`は必要ないです。
> ワイルドカード「_」で置き換えました。

C-Reverse-10-TailRecursion
--------------------------

末尾再帰？

    reverse :: [a] -> [a]
    reverse = reverse' []
      where
        reverse' :: [a] -> [a] -> [a]
        reverse' acc (x:xs) = reverse' (x : acc) xs
        reverse' acc _      = acc

> 関数型言語の経験を持っている方は末尾再帰を知っています。
> 他の言語にとっても大切です。
> Haskellは遅延評価を用いているため複雑になります。
> Haskellでは遅延評価を用いない時に大切です。

D-Closing-01-Practice
---------------------

演習問題で練習しましょう！

何か分からなかったら、質問してください。
