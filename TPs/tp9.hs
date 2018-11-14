{-
IX 1,2,3
X 1,2,3
-}

-- IX
-- 1
import System.IO

writePrimes :: [Int] -> IO ()
writePrimes [] = do
        return ()
writePrimes (x: xs) = do
        let ys = head $ getPrimes [x]
        putStrLn $ ordinalPrefix (snd ys) ++ " prime is " ++ show (fst ys)
        writePrimes xs

getPrimes :: [Int] -> [(Int, Int)]
getPrimes xs = filter (\x -> (snd x) `elem` xs) $ zip (take ((maximum xs) + 1) [x | x <- [2..], isPrime x]) [0..maximum xs]

isPrime :: Int -> Bool
isPrime n = null [x | x <- [2..n-1], n `mod` x == 0]

ordinalPrefix :: Int -> String
ordinalPrefix n
    | resto == 1 && n /= 11 = show n ++ "st"
    | resto == 2 && n /= 12 = show n ++ "nd"
    | resto == 3 && n /= 13 = show n ++ "rd"
    | otherwise = show n ++ "th"
    where resto = n `mod` 10

-- 2
palindrome :: String -> Bool
palindrome xs = xs == reverse xs
-- a
isPalindrome :: IO ()
isPalindrome = do
        putStr "What is the sequence? "
        xs <- getLine
        putStrLn $ if palindrome xs then "Yes" else "No"
-- b
isPalindromeConstant :: IO ()
isPalindromeConstant = do
        putStr "What is the sequence? "
        xs <- getLine
        if null xs
            then return ()
            else do
                putStrLn $ if palindrome xs then "Yes" else "No"
                isPalindromeConstant
-- c
-- interact :: (String -> String) -> IO ()
-- respondPalindrome = unlines . map (\xs -> if palindrome xs then "Yes" else "no") . lines
-- main' = interact . respondPalindrome
-- 3
printEven :: Int -> IO ()
printEven x = putStrLn $ if even x then "Par" else "Impar"
showParity :: [Int] -> IO ()
showParity [] = return ()
showParity (x: xs) = do
        printEven x
        showParity xs

showParity' :: [Int] -> IO ()
showParity' = mapM_ printEven
-- X
-- 1
toFile :: Show a => FilePath -> [a] -> IO ()
toFile path xs = do
        writeFile path $ foldl (\acc x -> acc ++ show x ++ "\n") [] xs

toFile' :: Show a => FilePath -> [a] -> IO ()
toFile' filePath = writeFile filePath . unlines . map show
-- unlines = join by "\n" all elements in a list

fromFile :: Read a => FilePath -> IO [a]
fromFile path = do
        contents <- readFile path
        return $ map read $ lines contents

sumInts :: FilePath -> IO Int
sumInts filePath = do
        ints <- fromFile filePath
        return $ sum ints
