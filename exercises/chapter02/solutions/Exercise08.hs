takeLast n xs = drop (length xs - n) xs

takeLast' n xs = reverse (take n (reverse xs))
