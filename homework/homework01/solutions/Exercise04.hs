revmid :: [a] -> [a]
revmid xs | length xs < 4 = xs
          | otherwise     = first : mid ++ [last]
  where
    (first:rest) = xs
    (last:mid) = reverse rest
