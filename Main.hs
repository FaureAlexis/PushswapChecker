{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

import System.Directory.Internal.Prelude (getArgs)
import System.IO (stdin, hGetLine)
import Foreign.Marshal.Unsafe (unsafeLocalState)
import Text.Show (show)
import Src.Bintree.Tree (treeSort)
import Src.Error.Exit (exitWithErrorMessage)

data Result = Ok | Ko ([String], [String])

instance Show Result where
    show Ok = "OK"
    show (Ko t) = "KO:" ++ show t

saAndSbSwap :: [String] -> String -> [String]
saAndSbSwap (x:xs) n =  x : n : xs

saAndSbFunc :: [String] -> [String]
saAndSbFunc [] = []
saAndSbFunc (x:xs) | null xs = [x]
                   | otherwise = saAndSbSwap xs x

paAndPbFunc :: [String] -> [String] -> ([String], [String])
paAndPbFunc a [] = (a, [])
paAndPbFunc [] (x:xs) = ([x], xs)
paAndPbFunc a (x:xs) = (x:a, xs)

raAndRbFunc :: [String] -> [String]
raAndRbFunc [] = []
raAndRbFunc (x:xs) = reverse (x : reverse xs)

rraAndRrbFunc :: [String] -> [String]
rraAndRrbFunc [] = []
rraAndRrbFunc f = raAndRbFunc (reverse f)

wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen f s =  case dropWhile f s of
                      "" -> []
                      x -> w : wordsWhen f y
                            where (w, y) = break f x

printResult :: [String] -> [String] -> IO ()
printResult [] _ = putStrLn (Ko ([], []))
printResult a b | a == treeSort a && null b = putStrLn Ok
                | otherwise = putStrLn (Ko (a, b))

parthAction :: [String] -> [String] -> [String] -> IO ()
parthAction [] a b = printResult a b
parthAction ("sa":xs) a b = parthAction xs (saAndSbFunc a) b
parthAction ("sb":xs) a b = parthAction xs a (saAndSbFunc b)
parthAction ("sc":xs) a b = parthAction xs (saAndSbFunc a)
                        (saAndSbFunc b)
parthAction ("pa":xs) a b = parthAction xs (fst (paAndPbFunc a b))
                        (snd (paAndPbFunc a b))
parthAction ("pb":xs) a b = parthAction xs (snd (paAndPbFunc b a))
                        (fst (paAndPbFunc b a))
parthAction ("ra":xs) a b = parthAction xs (raAndRbFunc a) b
parthAction ("rb":xs) a b = parthAction xs a (raAndRbFunc b)
parthAction ("rr":xs) a b = parthAction xs (raAndRbFunc a)
                        (raAndRbFunc b)
parthAction ("rra":xs) a b = parthAction xs (rraAndRrbFunc a) b
parthAction ("rrb":xs) a b = parthAction xs a (rraAndRrbFunc b)
parthAction ("rrr":xs) a b = parthAction xs (rraAndRrbFunc a)
                        (rraAndRrbFunc b)
parthAction (x:_) _ _ = exitWithErrorMessage (x ++ " is not an action")

main :: IO ()
main = parthAction (wordsWhen (==' ') (unsafeLocalState (hGetLine stdin)))
 (unsafeLocalState  getArgs) []