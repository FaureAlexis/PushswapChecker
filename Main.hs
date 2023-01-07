{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

import System.Directory.Internal.Prelude (getArgs)
import System.IO (stdin, hGetLine)
import Tree (treeSort)
import Foreign.Marshal.Unsafe (unsafeLocalState)

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
printResult a b | a == treeSort a && null b = print "OK"
                | otherwise = print "KO:" >>
                  print (a, b)

parthAction :: [String] -> [String] -> [String] -> IO ()
parthAction [] a b = printResult a b
parthAction (x:xs) a b | x == "sa" = parthAction xs (saAndSbFunc a) b
                       | x == "sb" = parthAction xs a (saAndSbFunc b)
                       | x == "sc" = parthAction xs (saAndSbFunc a)
                        (saAndSbFunc b)
                       | x == "pa" = parthAction xs (fst (paAndPbFunc a b))
                        (snd (paAndPbFunc a b))
                       | x == "pb" = parthAction xs (snd (paAndPbFunc b a))
                        (fst (paAndPbFunc b a))
                       | x == "ra" = parthAction xs (raAndRbFunc a) b
                       | x == "rb" = parthAction xs a (raAndRbFunc b)
                       | x == "rr" = parthAction xs (raAndRbFunc a)
                        (raAndRbFunc b)
                       | x == "rra" = parthAction xs (rraAndRrbFunc a) b
                       | x == "rrb" = parthAction xs a (rraAndRrbFunc b)
                       | x == "rrr" = parthAction xs (rraAndRrbFunc a)
                        (rraAndRrbFunc b)
                       | otherwise = print x

main :: IO()
main = parthAction (wordsWhen (==' ') (unsafeLocalState (hGetLine stdin))) (unsafeLocalState  getArgs) []