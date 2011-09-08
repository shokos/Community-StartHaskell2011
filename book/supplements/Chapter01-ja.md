第1章：補足
===========

記号表
------

記号の入力方法が分からなかったら、付録B（ページ200）を参考にしてください。

Preludeの関数
-------------

`Prelude`という標準ライブラリのモジュールは読み込まないように指示しないと
自動的に読み込みます。`Prelude`に沢山よく使う関数が定義しています。自分で作る
モジュールに同じ関数名の関数を定義したら、その関数を使う時に次のようなエラーが
出ます：

    sum.hs:2:18:
        Ambiguous occurrence `sum'
        It could refer to either `Main.sum', defined at sum.hs:1:1
                              or `Prelude.sum', imported from Prelude

この本によく`Prelude`で定義している関数を自分で実装します。他の解決する方法が
ありますけど、今はただ他の関数名で定義してください。例えば：

    sum' []     = 0
    sum' (x:xs) = x + sum' xs

`'`は特別な文字ではありません。`sum'`も普通の関数名です。
