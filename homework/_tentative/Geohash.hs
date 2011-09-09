-- This problem was planned for homework 2, but it turns out that the `Maybe`
-- type is used once!  Perhaps it can go in a later homework, after `Maybe`
-- has been dicussed.

-- base
import Data.Char (toLower)
import Data.List (elemIndex)

-- least significant bit at right
type Bit = Int

int2bin :: Int -> [Bit]
int2bin n | n >= 0    = int2bin' [] n
          | otherwise = error "n is negative"
  where
    int2bin' :: [Bit] -> Int -> [Bit]
    int2bin' acc n | n > 0     = int2bin' (n `mod` 2 : acc) (n `div` 2)
                   | otherwise = acc

bin2int :: [Bit] -> Int
bin2int = foldl (\a b -> 2 * a + b) 0

pad :: Int -> [Bit] -> [Bit]
pad n bs = take (n - length bs) (repeat 0) ++ bs

base32Charmap :: String
base32Charmap = "0123456789bcdefghjkmnpqrstuvwxyz"

base32Encode :: [Bit] -> String
base32Encode [] = ""
base32Encode bs = base32Charmap !! ((bin2int . take 5) bs)
                : base32Encode (drop 5 bs)

base32Decode :: String -> [Bit]
base32Decode = decode' [] . map toLower
  where
    decode' :: [Int] -> String -> [Bit]
    decode' acc (c:cs) = case c `elemIndex` base32Charmap of
                           Just i  -> decode' (i : acc) cs
                           Nothing -> error $ "invalid character: " ++ [c]
    decode' acc _      = (concat . map (pad 5 . int2bin) . reverse) acc

alternate :: ([a], [a]) -> [a]
alternate ((x:xs),(y:ys)) = x : y : alternate (xs, ys)
alternate (xs, ys)        = xs ++ ys

unalternate :: [a] -> ([a], [a])
unalternate = unalternate' [] []
  where
    unalternate' es os (x0:x1:xs) = unalternate' (x0 : es) (x1 : os) xs
    unalternate' es os [x]        = unalternate' (x : es) os []
    unalternate' es os _          = (reverse es, reverse os)

encodeBits :: Float -> Float -> Float -> [Bit]
encodeBits lmin lmax l | l > lmid  = 1 : encodeBits lmid lmax l
                       | otherwise = 0 : encodeBits lmin lmid l
  where
    lmid = (lmin + lmax) / 2

decodeBits :: Float -> Float -> [Bit] -> Float
decodeBits lmin lmax (b:bs) | b == 0    = decodeBits lmin lmid bs
                            | otherwise = decodeBits lmid lmax bs
  where
    lmid = (lmin + lmax) / 2
decodeBits lmin lmax _                  = (lmin + lmax) / 2

encode :: Int -> (Float, Float) -> String
encode prec (lat,long) = let latBs = encodeBits (-90) 90 lat
                             longBs = encodeBits (-180) 180 long
                             bs = alternate (longBs, latBs)
                         in take prec $ base32Encode bs

decode :: String -> (Float, Float)
decode s = let (long, lat) = unalternate $ base32Decode s
           in  (decodeBits (-90) 90 lat, decodeBits (-180) 180 long)
