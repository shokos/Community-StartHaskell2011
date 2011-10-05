Supplemental Exercises: Chapter 9
=================================

These are supplemental exercises for chapter 9 of _Programming in Haskell_.
Exercises 4 and 5 of the exercises in the book (pages 97 and 98) are more
involved and may be considered optional.

Exercise 7
----------

Modify your game of life implementation to use a larger board.  To make it
easier to design the initial state of a game, write a function that places a
pattern at a specific position on a board:

    placeAt :: Board  -- the board to place the pattern on
            -> [Pos]  -- the pattern to place
            -> Pos    -- the position on the board to place the pattern
            -> Board  -- the resulting board, after placement

Also write transformation functions of type `[Pos] -> [Pos]` to transform
patterns:

* `rotateCW` to rotate the pattern 90 degrees clockwise
* `rotateCCW` to rotate the pattern 90 degrees counter-clockwise
* `rotate180` to rotate the pattern 180 degrees
* `reflectV` to reflect the pattern vertically
* `reflectH` to reflect the pattern horizontally

What happens when two gliders have a head-on collision?

More inspiration:

* http://en.wikipedia.org/wiki/Gun_%28cellular_automaton%29
* http://en.wikipedia.org/wiki/Breeder_%28cellular_automaton%29

Exercise 8
----------

Write a function `nimAI :: Board -> Board` that plays a turn of Nim.  Modify
your implementation of the game to allow a single human player to play this
AI.
