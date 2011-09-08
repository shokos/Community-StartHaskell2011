pyths :: Int -> [(Int, Int, Int)]
pyths n | n > 0 = let d = [(x, x ^ 2) | x <- [1..n]]
                  in  [(x, y ,z) | (x,x2) <- d,
                                   (y,y2) <- drop x d,
                                   (z,z2) <- drop y d,
                                   x2 + y2 == z2]
