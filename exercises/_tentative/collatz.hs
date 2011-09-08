{-# LANGUAGE BangPatterns #-}

-- Source: http://projecteuler.net/index.php?section=problems&id=14

-- base
import Data.List (foldl1')
import System.Environment (getArgs)

collatz :: Int -> [Int]
collatz n | n > 0     = collatz' [] n
          | otherwise = error "n not strictly positive"
  where
    collatz' acc n | n == 1         = reverse $ n : acc
                   | n `mod` 2 == 0 = collatz' (n : acc) (n `div` 2)
                   | otherwise      = collatz' (n : acc) (3 * n + 1)

collatzMax :: Int -> Int
collatzMax max | max > 0   = fst (foldl1' c [(n, clen 0 n) | n <- [1..max]])
               | otherwise = error "max not strictly positive"
  where
    c p1@(_,c1) p2@(_,c2) | c1 > c2   = p1
                          | otherwise = p2
    clen !len !n | n == 1         = len + 1
                 | n `mod` 2 == 0 = clen (len + 1) (n `div` 2)
                 | otherwise      = clen (len + 1) (3 * n + 1)

main :: IO ()
main = do
    args <- getArgs
    if length args == 1
      then (putStrLn . show . collatzMax . read . head) args
      else putStrLn "syntax: collatz limit"
