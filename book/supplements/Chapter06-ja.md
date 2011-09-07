第6章：補足
===========

n+kパターンの変換
-----------------

この章はHaskellから廃止された「n+kパターン」を大々的に使います。例えば、
57ページに定義している`factorial`関数があります。

    factorial :: Int -> Int
    factorial 0       = 1
    factorial (n + 1) = (n + 1) * factorial n

次のように変換できます。

    factorial :: Int -> Int
    factorial 0 = 1
    factorial n = n * factorial (n - 1)
