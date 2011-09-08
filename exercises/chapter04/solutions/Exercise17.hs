fib :: Int -> Int
fib n = round (fib' (fromIntegral n))
  where
    fib' n = ((1 + root5) ^ n - (1 - root5) ^ n) / ((2 ^ n) * root5)
    root5 = sqrt 5
