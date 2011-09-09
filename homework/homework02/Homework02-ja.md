宿題2
=====

この宿題は「プログラミングHaskell」の第1～7章を扱っています。

問題1
-----

ワンタイムパッドとビットごとの排他的論理和（XOR）暗号を用いることで、第7章で
使った文字列を通信するプログラムを暗号で通信するように変更せよ。排他的論理和を
計算する関数`xor`を自分で定義せよ。短すぎなワンタイムパッドで呼び出された
場合のために、リストの要素を繰り返す関数`cycle`を使うと良い。

http://ja.wikipedia.org/wiki/ワンタイムパッド

http://en.wikipedia.org/wiki/XOR_cipher

次の関数の型が変更する。

* `encode :: String -> String -> [Bit]`
* `decode :: String -> [Bit] -> String`
* `transmit :: String -> String -> String`

以下の実行例で自分の定義が正しいことを確認せよ。

    > encode "haskell" "abc"
    [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    > decode "haskell" [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    "abc"
    > decode "bad" [1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
    "kbt"
    > transmit "TooShortOTP" "higher-order functions are easy"
    "higher-order functions are easy"

問題2
-----

リストの中から先頭の要素と述語で前の要素と比べて満たす要素を複数の方法で定義
せよ。リスト内包表記を用いて、`relFiltLC`を定義せよ。再帰を用いて、
`relFiltER`を定義せよ。高階関数を用いて、`relFiltHO`を定義せよ。

以下の実行例で自分の定義が正しいことを確認せよ。

    > relFiltLC (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltLC (<) "hackyskewlol"
    "haskell"
    > relFiltER (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltER (<) "hackyskewlol"
    "haskell"
    > relFiltHO (>) [3,1,4,1,5,9,2,6,5]
    [3,4,5,9,6]
    > relFiltHO (<) "hackyskewlol"
    "haskell"

問題3
-----

文字列のAlder-32チェックサムを計算する関数`adler32 :: String -> String`を定義
せよ。チェックサムを16進数で返せ。

http://ja.wikipedia.org/wiki/Adler-32

以下の実行例で自分の定義が正しいことを確認せよ。

    > adler32 "Wikipedia"
    "11E60398"
    > (adler32 . take 10000 . cycle) "haskell"
    "D8E52268"

もっと大きい文字列で計算したら、作った関数が得に遅いことに気付くはずだ。理由の
可能性が多いけど一つは`String`を使っているのだ。`String`がリストで作られている
データ構造だから遅い。`Data.ByteString`などが早い。

問題4
-----

ニュートン法を使って、ある精度以内に値の乗根を計算する関数を定義せよ。
（現実的な実装は精度を有効桁で計算し浮動小数点の型のハッキングが必要けどこの
問題のために気にしない方が良い。）

http://ja.wikipedia.org/wiki/ニュートン法

    nroot :: Double  -- Δ
          -> Double  -- 値
          -> Int     -- 次数
          -> Double  -- 乗根

以下の実行例で自分の定義が正しいことを確認せよ。

    > nroot 0.0000001 2 2
    1.4142135623730951
    > nroot 0.0000001 2 3
    1.2599210498948732
    > nroot 0.1 2 2
    1.4166666666666667
    > nroot 0.1 2 3
    1.2609322247417485
    > nroot 1 2 2
    1.5
    > nroot 0.0001 1331 3
    11.000000000000142
    > nroot 0.0001 123456789 6
    22.314431636474602
    > nroot 0.0001 0.0001 6
    0.2154434765980944
    > nroot 0.0001 (-2) 3
    -1.2599210498953948
    > nroot 0.0001 (-2) 2
    *** Exception: even root of negative

（精度以外に異なる可能性がある。）
