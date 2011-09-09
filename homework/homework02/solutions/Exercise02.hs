-- note: syntax such as `xs@(x:xs')` has not been introduced yet;
--       using it would improve these definitions

-- list comprehension version
relFiltLC :: (a -> a -> Bool) -> [a] -> [a]
relFiltLC p (x:xs) = x : [x2 | (x1,x2) <- zip (x:xs) xs, p x2 x1]

-- explicit recursion version
relFiltER :: (a -> a -> Bool) -> [a] -> [a]
relFiltER p (x:xs) = x : filter' (x:xs)
  where
    filter' (x1:x2:xs) | p x2 x1   = x2 : filter' (x2:xs)
                       | otherwise = filter' (x2:xs)
    filter' _                      = []

-- higher-order version
relFiltHO :: (a -> a -> Bool) -> [a] -> [a]
relFiltHO p (x:xs) = x : ((map fst . filter (uncurry p)) (zip xs (x:xs)))
