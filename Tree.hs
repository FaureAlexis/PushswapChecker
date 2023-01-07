{-
-- EPITECH PROJECT, 2023
-- Day03
-- File description:
-- Tree.sh
-}

module Tree where

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

addInTree :: Ord a => a -> Tree a -> Tree a
addInTree x Empty = Node Empty x Empty
addInTree x (Node g n d) | x < n = Node (addInTree x g) n d
                          | otherwise = Node g n (addInTree x d)

listToTree :: Ord a => [a] -> Tree a
listToTree [] = Empty
listToTree (x:xs) = addInTree x (listToTree xs)

treeToList :: Tree a -> [a]
treeToList Empty = []
treeToList (Node g n d) = treeToList g ++ (n:treeToList d)

treeSort :: Ord a => [a] -> [a]
treeSort l = treeToList (listToTree l)