{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- tests
-}

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Src.Pushswap.PushswapFunctions

main :: IO ()
main = hspec $ do
    describe "Pushswap Sort Functions" $ do
        describe "sa" $ do
            it "should swap the first two elements of a list" $ do
                saAndSbFunc [1, 2, 3] `shouldBe` [2, 1, 3]
                saAndSbFunc [] `shouldBe` []
        describe "sb" $ do
            it "should swap the first two elements of a list" $ do
                saAndSbFunc [1, 2, 3] `shouldBe` [2, 1, 3]
                saAndSbFunc [] `shouldBe` []
        describe "pa" $ do
            it "should take the first element of the second list and put it at the beginning of the first list" $ do
                paAndPbFunc [1, 2, 3] [4, 5, 6] `shouldBe` ([4, 1, 2, 3], [5, 6])
                paAndPbFunc [] [4, 5, 6] `shouldBe` ([4], [5, 6])
        describe "pb" $ do
            it "should take the first element of the first list and put it at the beginning of the second list" $ do
                paAndPbFunc [4, 5, 6] [1, 2, 3] `shouldBe` ([1, 4, 5, 6], [2, 3])
                paAndPbFunc [] [1, 2, 3] `shouldBe` ([1], [2, 3])
        describe "ra" $ do
            it "should rotate the first element of the first list to the last" $ do
                raAndRbFunc [1, 2, 3] `shouldBe` [2, 3, 1]
                raAndRbFunc [] `shouldBe` []
        describe "rb" $ do
            it "should rotate the first element of the second list to the last" $ do
                raAndRbFunc [1, 2, 3] `shouldBe` [2, 3, 1]
                raAndRbFunc [] `shouldBe` []
        describe "rra" $ do
            it "should rotate the last element of the first list to the first" $ do
                rraAndRrbFunc [1, 2, 3] `shouldBe` [3, 1, 2]
                rraAndRrbFunc [] `shouldBe` []
        describe "rrb" $ do
            it "should rotate the last element of the second list to the first" $ do
                rraAndRrbFunc [1, 2, 3] `shouldBe` [3, 1, 2]
                rraAndRrbFunc [] `shouldBe` []
