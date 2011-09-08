stddev :: [Double] -> Double
stddev xs = sqrt (sum [(x - avg) ^ 2 | x <- xs] / (n - 1))
  where
    n :: Double
    n = fromIntegral (length xs)
    avg :: Double
    avg = sum xs / n

stddev' :: Real a => [a] -> Double
stddev' xs = stddev [fromRational (toRational x) | x <- xs]
