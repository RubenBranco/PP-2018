import Data.Char

charCodePlusK :: Char -> Int -> Int
charCodePlusK character k = ord character + k

cifrarCesar :: Int -> String -> String
cifrarCesar k xs = [chr (charCodePlusK x k) | x <- xs]

decifrarCesar:: Int -> String -> String
decifrarCesar k xs = cifrarCesar (-k) xs

listaObelix :: Int -> String -> Int -> String
listaObelix k xs sign = [chr ((charCodePlusK x (k * sign)) + (i * sign)) | (i,x) <- zip [0..length xs] xs]

cifrarObelix :: Int -> String -> String
cifrarObelix k xs = listaObelix k xs 1

decifrarObelix :: Int -> String -> String
decifrarObelix k xs = listaObelix k xs (-1)

isPalindrome :: Int -> Bool
isPalindrome x = x == read (reverse (show x))

listOfPalindromes :: Int -> [Int]
listOfPalindromes n = [x | x <- [0..n], isPalindrome x]

tresPalindromos :: Int -> (Int, Int, Int)
tresPalindromos x = head [ (i, j, k) | i <- listOfPalindromes x, j <- listOfPalindromes x, k <- listOfPalindromes x, i + j + k == x]
