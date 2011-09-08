-- base
import Prelude hiding (maximum, minimum)

maximum :: Ord a => [a] -> a
maximum (x:xs) = maximum' x xs
  where
    maximum' cur (x:xs) | x > cur   = maximum' x xs
                        | otherwise = maximum' cur xs
    maximum' cur _                  = cur
maximum _      = error "maximum of empty list"

minimum :: Ord a => [a] -> a
minimum (x:xs) = minimum' x xs
  where
    minimum' cur (x:xs) | x < cur   = minimum' x xs
    minimum' cur _                  = cur
minimum _      = error "minimum of empty list"
