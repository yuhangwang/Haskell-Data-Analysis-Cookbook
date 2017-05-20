module Main where
import Control.Exception (catch, SomeException)
import System.Environment (getArgs)
import System.Directory (doesFileExist)


main1 = do
    args <- getArgs
    let file_name = case args of
            (a:_) -> a
            _ -> "input.txt"
    input <- catch (readFile file_name)
        $ \err -> print (err::SomeException) >> return ""
    print (countWords input)

main2 = do
    args <- getArgs
    let file_name = case args of
            (a:_) -> a
            _ -> "input.txt"
    exists <- doesFileExist file_name
    input <- if exists then readFile file_name else return ""
    print (countWords input)

countWords :: String -> [Int]
countWords input = map (length . words) (lines input)

main :: IO ()
main = main2