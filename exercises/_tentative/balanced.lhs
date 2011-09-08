* test for balanced parenthesis
* start and close parenthesis are parameters
* ignore any other characters (hint: use filter)

> isBalanced :: Char -> Char -> String -> Bool

    > isBalanced '(' ')' "(()())()"
    True
    > isBalanced '(' ')' " (1 * (2 + 3) * (4 + 5)) + (6 * 7) + 8"
    True
    > isBalanced '(' ')' " 1 + 2 "
    True
    > isBalanced '(' ')' "  )  "
    False
    > isBalanced '(' ')' " ) ( "
    False
    > isBalanced '(' ')' " ( ) ) ( ( ) "
    False
