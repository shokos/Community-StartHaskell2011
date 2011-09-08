--base
import Data.Char (isAsciiUpper, ord, toUpper)

foo :: String -> [Int]
foo xs = [ord x' + c | x <- xs, let x' = toUpper x, isAsciiUpper x']
  where
    c = 1 - ord 'A'

foo' :: String -> [Int]
foo' = map ((+ c) . ord) . filter isAsciiUpper . map toUpper
  where
    c = 1 - ord 'A'
