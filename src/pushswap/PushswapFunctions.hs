{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- pushswap checker
-}

module Src.Pushswap.PushswapFunctions where
import Data.Char (digitToInt)

saAndSbSwap :: [Int] -> Int -> [Int]
saAndSbSwap (x:xs) n =  x : n : xs

saAndSbFunc :: [Int] -> [Int]
saAndSbFunc [] = []
saAndSbFunc (x:xs) | null xs = [x]
                   | otherwise = saAndSbSwap xs x

paAndPbFunc :: [Int] -> [Int] -> ([Int], [Int])
paAndPbFunc a [] = (a, [])
paAndPbFunc [] (x:xs) = ([x], xs)
paAndPbFunc a (x:xs) = (x:a, xs)

raAndRbFunc :: [Int] -> [Int]
raAndRbFunc [] = []
raAndRbFunc (x:xs) = reverse (x : reverse xs)

rraAndRrbFunc :: [Int] -> [Int]
rraAndRrbFunc [] = []
rraAndRrbFunc f = reverse (raAndRbFunc (reverse f))

isIntchar :: Char -> Bool
isIntchar '-' = True
isIntchar x | x >= '0' && x <= '9' = True
            | otherwise = False

isIntstr :: String -> Bool
isIntstr [] = True
isIntstr (x:xs) | isIntchar x == True = isIntstr xs
                | otherwise = False

checkInt :: [String] -> Bool
checkInt [] = True
checkInt (x:xs) | isIntstr x == True = checkInt xs
                | otherwise = False

myStrToInt :: String -> Int
myStrToInt [] = 0
myStrToInt ('-':xs) = ((myStrToInt xs) * (-1))
myStrToInt (x:xs) = (digitToInt x) + ((myStrToInt xs) * 10)

isNegStrtoInt :: String -> Int
isNegStrtoInt ('-':xs) = myStrToInt (reverse xs) * (-1)
isNegStrtoInt n = myStrToInt (reverse n)

myStrListoIntList :: [String] -> [Int]
myStrListoIntList [] = []
myStrListoIntList (x:xs) = (isNegStrtoInt x):(myStrListoIntList xs)


getArgsToInt :: [String] -> [Int]
getArgsToInt [] = []
getArgsToInt s | checkInt s = myStrListoIntList s
               | otherwise = []
