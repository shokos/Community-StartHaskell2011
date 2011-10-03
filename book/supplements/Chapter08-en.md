Chapter 8: Supplement
=====================

Library
-------

This chapter is an introduction to monadic computation.  Monads are an
integral part of Haskell; special syntax such as `do` is made to work with the
`Monad` type class defined in the standard library.

One may define functions `return` and `(>>=)` as in this chapter, but they
will not work with the `do` syntax.  You can study and learn from this code,
but much of it will not compile or run.

As indicated in the chapter remarks (page 85), a library file is provided for
using the code in the chapter.  The library file contains the definitions of
sections 8.1 through 8.7, with modifications that are beyond the scope of this
book.  Here is a link:

http://www.cs.nott.ac.uk/~gmh/Parsing.lhs

To use this library, put it in the same directory as the file that you are
working on and include the following line at the top of the file:

    import Parsing

You need this library in order to work through section 8.8 and do the
exercises.
