-- base
import Prelude hiding (splitAt)

splitAt :: Int -> [a] -> ([a], [a])
splitAt n (x:xs) | n > 0 = let (ys, zs) = splitAt (n - 1) xs in (x:ys, zs)
splitAt _ xs             = ([], xs)
