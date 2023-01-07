{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

module Src.Checker.Checker where
import Src.Bintree.Tree (treeSort)
import Src.Error.Exit (errorBadAction, errorBadArgsList)
import Src.Pushswap.PushswapFunctions (saAndSbFunc, paAndPbFunc,
 raAndRbFunc, rraAndRrbFunc)


wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen f s =  case dropWhile f s of
                      "" -> []
                      x -> w : wordsWhen f y
                            where (w, y) = break f x

printResult :: [Int] -> [Int] -> IO ()
printResult a b | a == treeSort a && null b = putStrLn "OK"
                | otherwise = putStr "KO: " >> print (a, b)

suitParseAction :: [String] -> [Int] -> [Int] -> IO ()
suitParseAction ("ra":xs) a b = parseAction xs (raAndRbFunc a) b
suitParseAction ("rb":xs) a b = parseAction xs a (raAndRbFunc b)
suitParseAction ("rr":xs) a b = parseAction xs (raAndRbFunc a)
 (raAndRbFunc b)
suitParseAction ("rra":xs) a b = parseAction xs (rraAndRrbFunc a) b
suitParseAction ("rrb":xs) a b = parseAction xs a (rraAndRrbFunc b)
suitParseAction ("rrr":xs) a b = parseAction xs (rraAndRrbFunc a)
 (rraAndRrbFunc b)
suitParseAction _ _ _ = errorBadAction

parseAction :: [String] -> [Int] -> [Int] -> IO ()
parseAction  _ [] [] = errorBadArgsList
parseAction [] a b = printResult a b
parseAction ("sa":xs) a b = parseAction xs (saAndSbFunc a) b
parseAction ("sb":xs) a b = parseAction xs a (saAndSbFunc b)
parseAction ("sc":xs) a b = parseAction xs (saAndSbFunc a)
                        (saAndSbFunc b)
parseAction ("pa":xs) a b = parseAction xs (fst (paAndPbFunc a b))
                        (snd (paAndPbFunc a b))
parseAction ("pb":xs) a b = parseAction xs (snd (paAndPbFunc b a))
                        (fst (paAndPbFunc b a))
parseAction a b c = suitParseAction a b c
