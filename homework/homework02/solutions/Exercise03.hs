-- base
import Data.Char (ord)

hex :: Int -> String
hex n | n > 0     = hex' "" n
      | n == 0    = "0"
      | otherwise = error "n is negative"
  where
    hcs :: String
    hcs = "0123456789ABCDEF"
    hex' :: String -> Int -> String
    hex' acc n | n > 0     = hex' (hcs !! (n `mod` 16) : acc) (n `div` 16)
               | otherwise = acc

pad :: a -> Int -> [a] -> [a]
pad e c xs = take (c - length xs) (repeat e) ++ xs

adler32 :: String -> String
adler32 = calc 1 0 . map ord
  where
    calc :: Int -> Int -> [Int] -> String
    calc a b (x:xs) = let a' = a .+. x in calc a' (b .+. a') xs
    calc a b _      = pad '0' 4 (hex b) ++ pad '0' 4 (hex a)
    (.+.) :: Int -> Int -> Int
    x .+. y = (x + y) `mod` 65521
