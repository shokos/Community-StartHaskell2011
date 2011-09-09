-- base
import Data.Char (chr, ord)

type Bit = Int

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode' :: String -> [Bit]
encode' = concat . map (make8 . int2bin . ord)

xor :: (Bit, Bit) -> Bit
xor (x,y) | x == y    = 0
          | otherwise = 1

encode :: String -> String -> [Bit]
encode pad = map xor . (zip . cycle . encode') pad . encode'

chop8 :: [Bit] -> [[Bit]]
chop8 []   = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: String -> [Bit] -> String
decode pad = map (chr . bin2int) . chop8 . map xor
           . (zip . cycle . encode') pad

transmit :: String -> String -> String
transmit pad = decode pad . channel . encode pad

channel :: [Bit] -> [Bit]
channel = id
