factorial :: Int -> Int
factorial n | n > 0     = n * factorial (n - 1)
            | n == 0    = 1
            | otherwise = error "factorial of negative"
