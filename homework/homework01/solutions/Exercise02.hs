approxEq :: Float  -- delta
         -> Float  -- value1
         -> Float  -- value2
         -> Bool   -- True if value2 in (value1 - delta, value1 + delta)
approxEq d v1 v2 = (v2 > v1 - d) && (v2 < v1 + d)

approxEq' :: Float  -- value1
          -> Float  -- value2
          -> Bool   -- True if value2 in (value1 - .0001, value1 + .0001)
approxEq' = approxEq 0.0001

approxZero :: Float  -- value
           -> Bool   -- True if value in (-0.0001, 0.0001)
approxZero  = approxEq' 0
