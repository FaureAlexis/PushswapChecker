{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

import System.Directory.Internal.Prelude (getArgs)
import System.IO (readLn, stdin, hGetLine)

printArgs :: IO [String] -> IO ()
printArgs f = do
    x <- f
    print x

printEcho :: IO String -> IO ()
printEcho f = do
    z <- f
    print (wordsWhen (==' ') z)

wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen f s =  case dropWhile f s of
                      "" -> []
                      x -> w : wordsWhen f y
                            where (w, y) = break f x

main :: IO()
main = printArgs getArgs >> printEcho (hGetLine stdin)