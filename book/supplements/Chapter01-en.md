Chapter 1: Supplement
=====================

Symbol Table
------------

If you do not know how to enter a certain symbol, check the symbol table in
Appendix B (page 166).

Prelude Functions
-----------------

Unless you specify otherwise, the *Prelude* module of the standard library is
loaded automatically.  Many commonly-used functions are defined in the
*Prelude*.  If you make a module with a function that has the same name as a
function defined in the *Prelude*, then you will get an error like the
following when you try to use it:

    sum.hs:2:18:
        Ambiguous occurrence `sum'
        It could refer to either `Main.sum', defined at sum.hs:1:1
                              or `Prelude.sum', imported from Prelude

In this book, you will often implement functions that are defined in the
*Prelude*.  There are other ways to get around the above error, but for now
simply define your functions with different names.  For example:

    sum' []     = 0
    sum' (x:xs) = x + sum' xs

Note that `'` is not treated as a special character.  `sum'` is a normal
function name.
