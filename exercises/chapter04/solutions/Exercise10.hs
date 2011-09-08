isPrefixOf :: Eq a => [a]   -- list1
                   -> [a]   -- list2
                   -> Bool  -- True if list1 is a prefix of list2
xs `isPrefixOf` ys | pl <= length ys = xs == (take pl ys)
                   | otherwise       = False
  where
    pl = length xs

isSuffixOf :: Eq a => [a]   -- list1
                   -> [a]   -- list2
                   -> Bool  -- True if list1 is a suffix of list2
xs `isSuffixOf` ys | dl >= 0   = xs == (drop dl ys)
                   | otherwise = False
  where
    dl = (length ys) - (length xs)
