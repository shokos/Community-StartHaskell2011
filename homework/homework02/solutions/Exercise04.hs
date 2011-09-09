approxEq :: Real a => a -> a -> a -> Bool
approxEq d v1 v2 = (v2 > v1 - d) && (v2 < v1 + d)

nroot :: Double  -- precision
      -> Double  -- number
      -> Int     -- degree
      -> Double  -- root
nroot delta x r | x >= 0 || r `mod` 2 == 1 = nroot' x
                | otherwise                = error "even root of negative"
  where
    r' :: Double
    r' = fromIntegral r
    r1 :: Int
    r1 = r - 1
    nroot' :: Double -> Double
    nroot' y = let y' = y + (x - y ^ r) / (r' * y ^ r1)
               in  if approxEq delta y y' then y' else nroot' y'
