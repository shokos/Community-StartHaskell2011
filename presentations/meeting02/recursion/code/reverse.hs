-- base
import Prelude hiding (reverse)

reverse :: [a] -> [a]
reverse = reverse' []
  where
    reverse' :: [a] -> [a] -> [a]
    reverse' acc (x:xs) = reverse' (x : acc) xs
    reverse' acc _      = acc
