{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- pushswap checker
-}

import Data.Char

--saAndSbSwap :: [Int] -> String -> [String]
--saAndSbSwap (x:xs) n =  x : n : xs
--
--saAndSbFunc :: [String] -> [String]
--saAndSbFunc [] = []
--saAndSbFunc (x:xs) | null xs = [x]
--                   | otherwise = saAndSbSwap xs x
--
--paAndPbFunc :: [String] -> [String] -> ([String], [String])
--paAndPbFunc a [] = (a, [])
--paAndPbFunc [] (x:xs) = ([x], xs)
--paAndPbFunc a (x:xs) = (x:a, xs)
--
--raAndRbFunc :: [String] -> [String]
--raAndRbFunc [] = []
--raAndRbFunc (x:xs) = reverse (x : reverse xs)
--
--swap :: [String] -> [Int]
--swap [] = []
--swap (x:[]) = [x]
--swap (x:y:xs) = y:x:xs
--
--rotate :: [String] -> [Int]
--rotate [] = []
--rotate (x:xs) = reverse $ x:(reverse xs)
--
--rrotate :: [String] -> [Int]
--rrotate [] = []
--rrotate xs = (last xs):(init xs)
--
--pa :: [String] -> [String] -> [Int]
--pa _ [] = []
--pa (x:xs) (y:ys) = x:y:ys
--
--pb :: [String] -> [String] -> [Int]
--pb [] _ = []
--pb (x:xs) (y:ys) = y:x:xs

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
myStrToInt [] = []
myStrToInt (x:xs) = digitToInt x :myStrToInt xs

myStrListoIntList :: [String] -> [Int]
myStrListoIntList (x:xs) = myStrToInt

