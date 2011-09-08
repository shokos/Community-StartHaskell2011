2011/9/7 Y.Ogawa <ogawa.yasuyuki@nifty.co.jp>:

易：リストにインデックスをふる関数 :: [a]->[(Int,a)] を定義せよ

難：リストの、nの倍数番目の要素だけからなるリストを返す関数を定義せよ

* unsure of meaning; my guess:

> index :: [a] -> [(Int, a)]
> index = zip [1..]

    > index "haskell"
    [(1,'h'),(2,'a'),(3,'s'),(4,'k'),(5,'e'),(6,'l'),(7,'l')]

> indexn :: Int -> [a] -> [(Int, a)]
> indexn n xs = [p | p@(i,x) <- zip [1..] xs, i `mod` n == 0]

    > indexn 3 "haskell"
    [(3,'s'),(6,'l')]
