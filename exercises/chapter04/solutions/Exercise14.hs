bound :: (Int, Int) -> Int -> Int
bound = \(low, high) -> \x -> if   x < low
                              then low
                              else if x > high then high else x
