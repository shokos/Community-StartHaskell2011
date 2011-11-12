approxEq :: Real a => a -> a -> a -> Bool
approxEq d v1 v2 = (v2 > v1 - d) && (v2 < v1 + d)

nroot :: Double  -- precision
      -> Double  -- number
      -> Int     -- degree
      -> Double  -- root
nroot delta y n | y >= 0 || n `mod` 2 == 1 = nroot' y
                | otherwise                = error "even root of negative"
  where
    n' :: Double
    n' = fromIntegral n
    n1 :: Int
    n1 = n - 1
    nroot' :: Double -> Double
    nroot' x = let x' = x + (y - x ^ n) / (n' * x ^ n1)
               in  if approxEq delta x x' then x' else nroot' x'
