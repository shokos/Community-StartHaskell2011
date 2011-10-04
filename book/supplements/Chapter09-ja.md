第9章：補足
===========

getCh
-----

GHCの標準ライブラリーには`getCh`が含まれていません。次のファイルに定義
されています。

http://www.cs.nott.ac.uk/~gmh/calculator.lhs

もし自分で記述する場合（学習のためにもお勧めします）、次の定義です。

    -- base
    import System.IO (hSetEcho, stdin)

    getCh :: IO Char
    getCh = do hSetEcho stdin False
               c <- getChar
               hSetEcho stdin True
               return c

9.5節以降のコードを入力して実行できます。`getLine`と`putStr`、`putStrLn`は
`Prelude`に定義されているので、`Prelude`の定義を隠す必要があります：

    import Prelude hiding (getLine, putStr, putStrLn)

wait
----

プログラムで時間を待たせるのに、ビジーウェイトは悪い方法です。この章で
書いてある`wait 500`は最近のパソコンではほとんど効果がありません。代わりに
`Control.Concurrent`で定義されている`threadDelay`関数を使ってください。
`threadDelay 200000`とすれば十分時間を待たせられます。

練習問題1
---------

`\ESC[1D`という制御文字列はどのターミナルでも動きません。しかし動かなくても、
`getLine`の戻り値に消去された文字が含まれていないことを確認してください。
