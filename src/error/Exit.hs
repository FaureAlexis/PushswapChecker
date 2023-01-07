{-
-- EPITECH PROJECT, 2023
-- Day02
-- File description:
-- DoOp.sh
-}

module Src.Error.Exit where
import System.Exit (ExitCode (ExitFailure), exitWith)
import System.IO (hPutStrLn, stderr)

-- / Exit and display an error message on standard error stream :
-- / Usage : exitWithErrorMessage <message: String> <exit code: ExitCode>
-- / Example : exitWithErrorMessage "Missing argument" (ExitFailure 84)
exitWithErrorMessage :: String -> ExitCode -> IO a
exitWithErrorMessage msg code = hPutStrLn stderr msg >> exitWith code

-- / Exit and display an error message when there is an error with arguments :
-- / Usage : errorBadArgsList
errorBadArgsList :: IO a
errorBadArgsList = exitWithErrorMessage
                "Arguments type should only be signed int"
                (ExitFailure 84)

-- / Exit and display an error message when there is no actions :
-- / Usage : errorNoActionsProvided
errorNoActionsProvided :: IO a
errorNoActionsProvided = exitWithErrorMessage
        "No actions where provided on standard input stream. Please see --help"
        (ExitFailure 84)
