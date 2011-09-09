approxEq :: Float  -- delta
         -> Float  -- value1
         -> Float  -- value2
         -> Bool   -- True if value1 in (value1 - delta, value1 + delta)
approxEq d v1 v2 = (v2 > v1 - d) && (v2 < v1 + d)

isCoplanar :: (Float, Float, Float)  -- point1
           -> (Float, Float, Float)  -- point2
           -> (Float, Float, Float)  -- point3
           -> (Float, Float, Float)  -- point4
           -> Bool                   -- True if coplanar
isCoplanar (p1x,p1y,p1z) (p2x,p2y,p2z) (p3x,p3y,p3z) (p4x,p4y,p4z)
    = approxEq 0.000001 0.0 det
  where
    det = p1x * (p2y * (p3z - p4z) - p2z * (p3y - p4y)
                                   + (p3y * p4z - p3z * p4y))
        - p1y * (p2x * (p3z - p4z) - p2z * (p3x - p4x)
                                   + (p3x * p4z - p3z * p4x))
        + p1z * (p2x * (p3y - p4y) - p2y * (p3x - p4x)
                                   + (p3x * p4y - p3y * p4x))
        - (p2x * (p3y * p4z - p3z * p4y) - p2y * (p3x * p4z - p3z * p4x)
                                         + p2z * (p3x * p4y - p3y * p4x))

isClockwise :: (Float, Float, Float)  -- point1
            -> (Float, Float, Float)  -- point2
            -> (Float, Float, Float)  -- point3
            -> (Float, Float, Float)  -- reference point
            -> Bool                   -- True if clockwise
isClockwise (p1x,p1y,p1z) (p2x,p2y,p2z) (p3x,p3y,p3z) (pRx,pRy,pRz) = mN < mP
  where
    -- calculate plane vectors
    (pv1x,pv1y,pv1z) = (p2x - p1x, p2y - p1y, p2z - p1z)
    (pv2x,pv2y,pv2z) = (p3x - p1x, p3y - p1y, p3z - p1z)
    -- calculate a normal
    (nx,ny,nz) = (pv1y * pv2z - pv1z * pv2y, pv1z * pv2x - pv1x * pv2z,
                  pv1x * pv2y - pv1y * pv2x)
    -- calculate positive and negative points
    (pPx,pPy,pPz) = (p1x + nx, p1y + ny, p1z + nz)
    (pNx,pNy,pNz) = (p1x - nx, p1y - ny, p1z - nz)
    -- calculate vectors from positive and negative points to reference point
    (vPx,vPy,vPz) = (pRx - pPx, pRy - pPy, pRz - pPz)
    (vNx,vNy,vNz) = (pRx - pNx, pRy - pNy, pRz - pNz)
    -- calculate normalized magnitudes
    mP = sqrt (vPx ^ 2 + vPy ^ 2 + vPz ^ 2)
    mN = sqrt (vNx ^ 2 + vNy ^ 2 + vNz ^ 2)

isValidTP :: (Float, Float, Float)  -- point1 (X,Y,Z)
          -> (Float, Float, Float)  -- point2 (X,Y,Z)
          -> (Float, Float, Float)  -- point3 (X,Y,Z)
          -> (Float, Float, Float)  -- point4 (X,Y,Z)
          -> (Float, Float, Float)  -- point5 (X,Y,Z)
          -> (Float, Float, Float)  -- point6 (X,Y,Z)
          -> Bool                   -- True if order is correct
isValidTP p1 p2 p3 p4 p5 p6
    = coplanar && cw1234 && cw5643 && cw614 && cw253 && cw6521
  where
    -- all quadrangular faces are coplanar
    coplanar = (isCoplanar p1 p2 p3 p4) && (isCoplanar p5 p6 p4 p3)
            && (isCoplanar p6 p5 p2 p1)
    -- face 1234 vertices are in correct order
    cw1234 = (isClockwise p1 p2 p3 p6) && (isClockwise p2 p3 p4 p5)
          && (isClockwise p3 p4 p1 p5) && (isClockwise p4 p1 p2 p6)
    -- face 5643 vertices are in correct order
    cw5643 = (isClockwise p5 p6 p4 p2) && (isClockwise p6 p4 p3 p1)
          && (isClockwise p4 p3 p5 p1) && (isClockwise p3 p5 p6 p2)
    -- faces 614 vertices are in correct order
    cw614 = isClockwise p6 p1 p4 p5
    -- faces 253 vertices are in correct order
    cw253 = isClockwise p2 p5 p3 p1
    -- face 6521 vertices are in correct order
    cw6521 = (isClockwise p6 p5 p2 p4) && (isClockwise p5 p2 p1 p3)
          && (isClockwise p2 p1 p6 p3) && (isClockwise p1 p6 p5 p4)
