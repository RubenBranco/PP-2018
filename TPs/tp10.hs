import System.Environment
import System.IO
import Data.String

-- 5 a 7

fromFile :: Read a => FilePath -> IO [a]
fromFile path = do
        contents <- readFile path
        return $ map read $ lines contents

toFile :: Show a => FilePath -> [a] -> IO ()
toFile filePath = writeFile filePath . unlines . map show

-- 5 a
filterFiles :: (String -> Bool) -> FilePath -> FilePath -> IO ()
filterFiles p readPath writePath = do
        contents <- fromFile readPath
        toFile writePath . filter p contents

-- 5 b

isPrefix :: Eq a => [a] -> [a] -> Bool
isPrefix prefix xs = take (length prefix) xs == prefix

filterPrefix :: String -> FilePath -> FilePath -> IO ()
filterPrefix prefix readPath writePath = do
        filterFiles (isPrefix prefix) readPath writePath

-- 5 c
filterPrefix' prefix = interact $ unlines . filtr (isPrefix prefix) . lines
main' = do
        [f, from, to] <- getArgs
        filterPrefix' f from to
-- 6

wc :: IO ()
wc = do
    (fileName) <- getArgs
    contents <- fromFile fileName
    let lines = length contents
    let characterCount = sum $ map (\xs -> length xs) contents
    let wordCount = sum $ map (\xs -> length $ words xs) contents
    putStrLn $ (show lines) ++ "\t" ++ (show wordCount) ++ "\t" ++ (show characterCount)
    return ()

-- 7
linhasComNumeros :: [String] -> [String]
linhasComNumeros xs = zipWith (\x y -> show x ++ " - " ++ y) [1..] xs

main'' = do
        contents <- readFile "menu.txt"
        let l = linhasComNumeros $ lines contents
        putStrLn $ unlines l
        {-
        alternatives:
                sequence $ map putStrLn l
                mapM_ putStrLn l
        -}
