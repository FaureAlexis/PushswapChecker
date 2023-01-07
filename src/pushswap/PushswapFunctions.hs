{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- pushswap checker
-}

module Src.Pushswap.PushswapFunctions where

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

isIntchar :: Char -> Bool
isIntchar (x) | x >= '0' && x <= '9' = True
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
myStrToInt (x:xs) = (digitToInt x) + ((myStrToInt xs) * 10)

myStrListoIntList :: [String] -> [Int]
myStrListoIntList [] = []
myStrListoIntList (x:xs) = (myStrToInt (reverse x)):(myStrListoIntList xs)

