-- base
import Data.List (transpose)

slide :: Int -> [a] -> [[a]]
slide w xs | w > 0     = transpose (slide' w xs)
           | otherwise = error "invalid slide width"
  where
    slide' :: Int -> [a] -> [[a]]
    slide' n ys | n == 0 || null ys = []
                | otherwise         = ys : slide' (n - 1) (tail ys)
