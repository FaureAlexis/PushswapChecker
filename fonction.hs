{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- pushswap checker
-}

swap :: [Char] -> [Char]
swap [] = []
swap (x:[]) = [x]
swap (x:y:xs) = y:x:xs

rotate :: [Char] -> [Char]
rotate [] = []
rotate (x:xs) = reverse $ x:(reverse xs)

rrotate :: [Char] -> [Char]
rrotate [] = []
rrotate xs = (last xs):(init xs)

pa :: [Char] -> [Char] -> [Char]
pa _ [] = []
pa (x:xs) (y:ys) = x:y:ys

pb :: [Char] -> [Char] -> [Char]
pb [] _ = []
pb (x:xs) (y:ys) = y:x:xs

isInt :: Char -> Bool
isInt x | x >= '0' && x <= '9' = True
        | otherwise = False

checkInt :: [Char] -> [Int]
checkInt [] = True
checkInt (x:xs) | isInt x == True = checkInt xs
                | otherwise = False

CharToInt :: [Char] -> [Int]
CharToInt (x:xs) = x
