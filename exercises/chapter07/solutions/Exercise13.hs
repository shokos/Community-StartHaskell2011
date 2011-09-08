merge :: Ord a => [a] -> [a] -> [a]
merge xs@(x:xs') ys@(y:ys') | x < y     = x : merge xs' ys
                            | y < x     = y : merge xs ys'
                            | otherwise = x : y : merge xs' ys'
merge xs ys                             = xs ++ ys

nmerge :: Ord a => [[a]] -> [a]
nmerge = foldr merge []
