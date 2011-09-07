第5章：補足
===========

isLower, ord, chr
-----------------

`isLower`、`ord`、`chr`の関数は`Data.Char`のモジュールに定義されています。
`Prelude`のモジュールに定義されてないのでインポートする必要です。これをする
ために以下の行をファイルの上に入れてください。

    import Data.Char (chr, isLower, ord)
