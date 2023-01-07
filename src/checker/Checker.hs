{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

module Src.Checker.Checker where
import System.Directory.Internal.Prelude (getArgs)
import System.IO (stdin, hGetLine)
import Foreign.Marshal.Unsafe (unsafeLocalState)
import Text.Show (show)
import Src.Bintree.Tree (treeSort)

import Src.Error.Exit

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
printResult [] _ = putStrLn ("KO" ([], []))
printResult a b | a == treeSort a && null b = putStrLn "OK"
                | otherwise = putStrLn ("Ko" (a, b))

parseAction :: [String] -> [String] -> [String] -> IO ()
parseAction [] a b = printResult a b
parseAction ("sa":xs) a b = parseAction xs (saAndSbFunc a) b
parseAction ("sb":xs) a b = parseAction xs a (saAndSbFunc b)
parseAction ("sc":xs) a b = parseAction xs (saAndSbFunc a)
                        (saAndSbFunc b)
parseAction ("pa":xs) a b = parseAction xs (fst (paAndPbFunc a b))
                        (snd (paAndPbFunc a b))
parseAction ("pb":xs) a b = parseAction xs (snd (paAndPbFunc b a))
                        (fst (paAndPbFunc b a))
parseAction ("ra":xs) a b = parseAction xs (raAndRbFunc a) b
parseAction ("rb":xs) a b = parseAction xs a (raAndRbFunc b)
parseAction ("rr":xs) a b = parseAction xs (raAndRbFunc a)
                        (raAndRbFunc b)
parseAction ("rra":xs) a b = parseAction xs (rraAndRrbFunc a) b
parseAction ("rrb":xs) a b = parseAction xs a (rraAndRrbFunc b)
parseAction ("rrr":xs) a b = parseAction xs (rraAndRrbFunc a)
                        (rraAndRrbFunc b)
parseAction (x:_) _ _ = errorBadAction
