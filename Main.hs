{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

import Src.Checker.Checker (parseAction, wordsWhen)
import System.IO ( hGetLine, stdin )

main :: IO ()
main = parseAction (wordsWhen (==' ') (unsafeLocalState (hGetLine stdin)))
    (unsafeLocalState  getArgs) []