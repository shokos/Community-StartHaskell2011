hoge :: a -> [a] -> a -> [a] -> [a] -> (a, a) -> [a]
hoge a bs c ds es (f,g) = a : (bs ++ (c : (ds ++ es ++ (f : [g]))))
