-- Thanks to Ken Kawamoto for a great algorithm!

approxEq :: Float -> Float -> Float -> Bool
approxEq d v1 v2 = (v2 > v1 - d) && (v2 < v1 + d)

-- approximate equality for this problem
(~=) :: Float -> Float -> Bool
(~=) = approxEq 0.000001

-- approximate equality for vectors
(~=#) :: (Float, Float, Float) -> (Float, Float, Float) -> Bool
(x1,y1,z1) ~=# (x2,y2,z2) = (x1 ~= x2) && (y1 ~= y2) && (z1 ~= z2)

-- create a vector from 1st to second point
vec :: (Float, Float, Float)
    -> (Float, Float, Float)
    -> (Float, Float, Float)
vec (x1,y1,z1) (x2,y2,z2) = (x2 - x1, y2 - y1, z2 - z1)

-- dot product
(...) :: (Float, Float, Float)
      -> (Float, Float, Float)
      -> Float
(a1,a2,a3) ... (b1,b2,b3) = a1 * b1 + a2 * b2 + a3 * b3

-- cross product
(***) :: (Float, Float, Float)
      -> (Float, Float, Float)
      -> (Float, Float, Float)
(a1,a2,a3) *** (b1,b2,b3) = (a2 * b3 - a3 * b2,
                             a3 * b1 - a1 * b3,
                             a1 * b2 - a2 * b1)

-- vector size
size :: (Float, Float, Float)
     -> Float
size (x,y,z) = sqrt (x ^ 2 + y ^ 2 + z ^ 2)

-- validate order of vertices of triangular prism
-- 1. confirm that the trianglar faces are parallel
-- 2. confirm relative position of triangular faces
isValidTP :: (Float, Float, Float)  -- vertex1 (X,Y,Z)
          -> (Float, Float, Float)  -- vertex2 (X,Y,Z)
          -> (Float, Float, Float)  -- vertex3 (X,Y,Z)
          -> (Float, Float, Float)  -- vertex4 (X,Y,Z)
          -> (Float, Float, Float)  -- vertex5 (X,Y,Z)
          -> (Float, Float, Float)  -- vertex6 (X,Y,Z)
          -> Bool                   -- True if order is correct
isValidTP v1 v2 v3 v4 v5 v6 =
    let xp164 = (vec v1 v6) *** (vec v1 v4)
        xp253 = (vec v2 v5) *** (vec v2 v3)
        vec12 = (vec v1 v2)
    in  (xp164 ~=# xp253) && ((xp164 ... vec12) ~= ((size xp164) * (size vec12)))

---------------
-- Test Data --
---------------

rotateZ :: Float -> (Float, Float, Float) -> (Float, Float, Float)
rotateZ theta (x,y,z) = let s = sin theta
                            c = cos theta
                        in  (c * x - s * y, s * x + c * y, z)

rotateX :: Float -> (Float, Float, Float) -> (Float, Float, Float)
rotateX theta (x,y,z) = let s = sin theta
                            c = cos theta
                        in  (x, c * y - s * z, s * y + c * z)

rotateY :: Float -> (Float, Float, Float) -> (Float, Float, Float)
rotateY theta (x,y,z) = let s = sin theta
                            c = cos theta
                        in  (c * x + s * z, y, c * z - s * x)

tp1  = [(2,0,0),(2,2,0),(0,2,2),(0,0,2),(-2,2,0),(-2,0,0)]
tp1' = let theta = pi / 4
       in map (rotateY theta . rotateX theta . rotateZ theta) tp1
tp2  = [(2,0,0),(2,-2,0),(0,-2,-2),(0,0,-2),(-2,-2,0),(-2,0,0)]
tp3  = [(2,0,0),(2,2,0),(0,2,2),(0,0,2),(-2,0,0),(-2,2,0)]
tp4  = [(2,0,0),(2,-2,0),(0,-2,-2),(0,0,-2),(-2,0,0),(-2,-2,0)]
tp5  = [(0,0,1),(0,1,1),(1,1,0),(1,0,0),(-1,1,0),(-1,0,0)]
tp6  = [(2,2,0),(2,0,0),(0,0,2),(0,2,2),(-2,0,0),(-2,2,0)]

isValidTP' x = isValidTP (x !! 0) (x !! 1) (x !! 2) (x !! 3) (x !! 4) (x !! 5)

test = isValidTP' tp1
    && isValidTP' tp1'
    && isValidTP' tp2
    && not (isValidTP' tp3)
    && not (isValidTP' tp4)
    && not (isValidTP' tp5)
    && not (isValidTP' tp6)
