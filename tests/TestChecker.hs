{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- tests
-}

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "Pushswap_checker" $ do
        describe "Final result is sorted" $ do
            it "Return 0" $ do
                --assert 0
            it "Print OK" $ do
                --assert stdout eq OK
        describe "Final result is negative and not sorted" $ do
            it "Return 84" $ do
                --assert 84
            it "Print KO and the current state of the list" $ do
                --asser stdout eq KO: ([], [])
        describe "Error handling" $ do
            describe "Actions are empty" $ do
            describe "List contain only numbers" $ do
