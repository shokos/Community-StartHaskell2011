compLevel :: (Int, Int)  -- width (pixels), height (pixels)
          -> Float       -- framerate (frames / second)
          -> Int         -- length (seconds)
          -> Float       -- audio bitrate (Kb / second)
          -> Float       -- file size (MiB)
          -> Float       -- video compression level
compLevel (w,h) fr secs abr fs = uvbr / cvbr
  where
    uvbr = fromIntegral (w * h) * 24 * fr / 1000
    cvbr = fs * 1024 / 1000 * 1024 * 8 / fromIntegral secs - abr
