import Data.Char

teclasParaPalavra :: String -> String
teclasParaPalavra (x:xs) = keysToString xs x (charToString x)

keysToString :: String -> Char -> String -> String
keysToString [] y ys
        | not (' ' `elem` ys) = groupToChar y ys : []
        | otherwise = []
keysToString (x:xs) y ys
        | x /= y && not (' ' `elem` ys) = groupToChar y ys : keysToString xs x (charToString x)
        | ' ' `elem` ys = keysToString xs x (charToString x)
        | otherwise = keysToString xs x (x:ys)

groupToChar :: Char -> String -> Char
groupToChar x xs = chr (ord 'A' + idx + (length xs) - 1)
                    where key = (digitToInt x) - 2
                          idx = (if key >= 6 then 1 else 0) + key * 3

charToString :: Char -> String
charToString x = x : []
