-- base
import Prelude hiding (splitAt)

splitAt :: Int -> [a] -> ([a], [a])
splitAt = splitAt' []
  where
    splitAt' acc i (y:ys) | i > 0 = splitAt' (y:acc) (i - 1) ys
    splitAt' acc _ ys = (reverse acc, ys)
