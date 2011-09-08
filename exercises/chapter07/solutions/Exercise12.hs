concatR :: [[a]] -> [a]
concatR = foldr (++) []

concatL :: [[a]] -> [a]
concatL = foldl (++) []
