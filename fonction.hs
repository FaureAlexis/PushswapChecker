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

rotate :: [String] -> [String]
rotate [] = []
rotate (x:xs) = reverse $ x:(reverse xs)

rrotate :: [String] -> [String]
rrotate [] = []
rrotate xs = (last xs):(init xs)

pa :: [String] -> [String] -> [String]
pa _ [] = []
pa (x:xs) (y:ys) = x:y:ys

pb :: [String] -> [String] -> [String]
pb [] _ = []
pb (x:xs) (y:ys) = y:x:xs

isInt :: String -> Bool
isInt x | x >= '0' && x <= '9' = True
        | otherwise = False

checkInt :: [String] -> [Int]
checkInt [] = True
checkInt (x:xs) | isInt x == True = checkInt xs
                | otherwise = False

