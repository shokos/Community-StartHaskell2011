Chapter 9: Supplement
=====================

getCh
-----

GHC does not have a `getCh` function built in.  One is included in the
provided library file:

http://www.cs.nott.ac.uk/~gmh/calculator.lhs

If you prefer to type the code in yourself (which is highly recommended when
learning!), then all you need is the following code:

    -- base
    import System.IO (hSetEcho, stdin)

    getCh :: IO Char
    getCh = do hSetEcho stdin False
               c <- getChar
               hSetEcho stdin True
               return c

You may enter and execute the code from sections 9.5 on.  Note that the
functions `getLine`, `putStr`, and `putStrLn` are all defined in the
`Prelude`, so you will need to hide the `Prelude` definitions if you
define them yourself as in section 9.5:

    import Prelude hiding (getLine, putStr, putStrLn)

wait
----

Busy waiting is not a good way to create delays in a program.  On modern
hardware, `wait 500` has virtually no effect.  Instead, use the `threadDelay`
function defined in the `Control.Concurrent` module.  Using
`threadDelay 200000` should slow things down sufficiently.

Exercise 1
----------

The `\ESC[1D` ANSI sequence does not work in all terminals.  Even if it does
not work in your terminal, make sure that the value returned by your
implementation of `getLine` does not include deleted characters.
