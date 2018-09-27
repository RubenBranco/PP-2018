import Data.Char

charCodePlusK :: Char -> Int -> Int
charCodePlusK character k = ord character + k

cifrarCesar :: Int -> String -> String
cifrarCesar k xs = [chr (charCodePlusK x k) | x <- xs]

descifrarCesar:: Int -> String -> String
descifrarCesar k xs = cifrarCesar (-k) xs

listaObelix :: Int -> String -> Int -> String
listaObelix k xs sign = [chr ((charCodePlusK x (k * sign)) + (i * sign)) | (i,x) <- zip [0..length xs] xs]

cifrarObelix :: Int -> String -> String
cifrarObelix k xs = listaObelix k xs 1

decifrarObelix :: Int -> String -> String
decifrarObelix k xs = listaObelix k xs (-1)

isPalindrome :: Int -> Bool
isPalindrome x = x == read (reverse (show x))

tresPalindromos :: Int -> (Int, Int, Int)
tresPalindromos x = head [(i, j, k) | i <- [0..x], isPalindrome i, j <- [0..x], isPalindrome j, k <- [0..x], isPalindrome k, i + j + k == x]
