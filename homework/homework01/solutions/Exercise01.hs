magComp :: Float  -- magnitude of earthquake one (M)
        -> Float  -- magnitude of earthquake two (M)
        -> Float  -- strength of earthquake one compared to earthquake two
magComp m1 m2 = 10 ** ((m1 - m2) * 3 / 2)
