everyOther :: [a] -> [a]
everyOther (x:xs) = x : everyOther' xs
  where
    everyOther' (_:xs) = everyOther xs
    everyOther' _      = []
everyOther _      = []
