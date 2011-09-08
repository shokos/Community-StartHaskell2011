count :: (a -> Bool) -> [a] -> Int
count p = foldr step 0
  where
    step x c | p x       = c + 1
             | otherwise = c
