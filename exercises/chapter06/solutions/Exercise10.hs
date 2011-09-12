-- base
--import Data.List (transpose)
transpose :: [[a]] -> [[a]]
transpose = transpose' [] []
  where
    transpose' :: [a] -> [[a]] -> [[a]] -> [[a]]
    transpose' cur rest (xs:xss)
      | null xs   = transpose' cur rest xss
      | otherwise = transpose' (head xs : cur) (tail xs : rest) xss
    transpose' cur rest _
      | null rest = []
      | otherwise = reverse cur : transpose' [] [] (reverse rest)

slide :: Int -> [a] -> [[a]]
slide w xs | w > 0     = transpose (slide' w xs)
           | otherwise = error "invalid slide width"
  where
    slide' :: Int -> [a] -> [[a]]
    slide' n ys | n == 0 || null ys = []
                | otherwise         = ys : slide' (n - 1) (tail ys)
