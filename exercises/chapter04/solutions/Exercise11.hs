nand :: Bool -> Bool -> Bool
True `nand` True = False
_    `nand` _    = True

nor :: Bool -> Bool -> Bool
False `nor` False = True
_     `nor` _     = False

xor :: Bool -> Bool -> Bool
x `xor` y = x /= y

fullAdder :: Bool -> Bool -> Bool -> (Bool, Bool)
fullAdder a b c = (aXORb `xor` c, (aXORb `nand` c) `nand` (a `nand` b))
  where
    aXORb = a `xor` b
