--base
import Data.Char (digitToInt, isDigit)

luhncheck :: String -> Bool
luhncheck = check False 0 . reverse . map digitToInt . filter isDigit
  where
    check e acc (x:xs) | e         = check (not e) (dbl x + acc) xs
                       | otherwise = check (not e) (x + acc) xs
    check _ acc _                  = acc `mod` 10 == 0
    dbl x | x > 4     = x * 2 - 9
          | otherwise = x * 2
