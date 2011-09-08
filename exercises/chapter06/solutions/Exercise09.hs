-- base
import Prelude hiding (splitAt)

splitAt :: Int -> [a] -> ([a], [a])
splitAt i xs = splitAt' [] i xs
  where
    splitAt' acc i ys'@(y:ys) | i > 0     = splitAt' (y : acc) (i - 1) ys
                              | otherwise = (reverse acc, ys')
    splitAt' acc _ _                      = (xs, [])
