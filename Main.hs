{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

import System.IO (hGetLine, stdin)
import System.Directory.Internal.Prelude (getArgs)
import Foreign.Marshal.Unsafe (unsafeLocalState)
import Src.Checker.Checker (parseAction, wordsWhen)
import Src.Pushswap.PushswapFunctions (checkInt)

main :: IO ()
main = parseAction (wordsWhen (==' ') (unsafeLocalState (hGetLine stdin)))
    (checkInt (unsafeLocalState getArgs)) []
