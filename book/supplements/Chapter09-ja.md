第9章：補足
===========

getCh
-----

GHCの標準ライブラリーに`getCh`が含まれていません。次のファイルに定義
されています。

http://www.cs.nott.ac.uk/~gmh/calculator.lhs

もし自分で入力した場合、次の定義です。

    -- base
    import System.IO (hSetEcho, stdin)

    getCh :: IO Char
    getCh = do hSetEcho stdin False
               c <- getChar
               hSetEcho stdin True
               return c

9.5からのコードを入力して実行できます。`getLine`と`putStr`と`putStrLn`は
`Prelude`に定義されているので`Prelude`の定義を隠す必要です：

    import Prelude hiding (getLine, putStr, putStrLn)

wait
----

プログラムで時間を待たせる方法は、ビジーウェイトが悪い方法です。この章で書いて
ある`wait 500`は近代的なパソコンでは効果があんまりないです。代わりに、
`Control.Concurrent`で定義されている関数`threadDelay`を使ってください。
`threadDelay 200000`は十分時間を待たせられます。

練習問題1
---------

`\ESC[1D`の制御文字列はすべてなターミナルで動かしません。でも動かさなくても
`getLine`の戻り値に消去された文字が含まれてないことを確認してください。
