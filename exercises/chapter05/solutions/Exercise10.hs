-- base
import Data.Char (toLower)

vowelPositions :: String -> [Int]
vowelPositions cs = [i | (i,c) <- zip [1..] cs, isVowel c]
  where
    isVowel :: Char -> Bool
    isVowel = (`elem` "aeiou") . toLower
