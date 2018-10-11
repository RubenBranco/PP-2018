halveWhere :: [a] -> ([a], [a])
halveWhere xs = (take half xs, drop half xs) where half=length xs `div` 2

halveLet :: [a] -> ([a], [a])
halveLet xs = let half = length xs `div` 2 in (take half xs, drop half xs)

--polinomialRoot :: Int -> Int -> Int -> (Int, Int)
--opolinomialRoot a b c = ((((-b) / 2 * a) - delta), (((-b) / 2 * a) + delta)) where delta = (sqrt (b**2 - 4 * a * c)) / (2.0 * a)

sum':: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

replicate':: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x
        | n < 0 = []
        | otherwise = x : replicate' (n-1) x

substitui :: (Eq a) => a -> a -> [a] -> [a]
substitui _ _ [] = []
substitui a b (x:xs) = (if x == a then b else x) : substitui a b xs

posicoes' :: [Int] -> Int -> Int -> [Int]
posicoes' [] _ _ = []
posicoes' (x:xs) a id
    | x `mod` a == 0 = id : posicoes' xs a (id + 1)
    | otherwise = posicoes' xs a (id + 1)

posicoes :: [Int] -> Int -> [Int]
posicoes xs a = posicoes' xs a 0

repBinaria :: Int -> Int
repBinaria x
    | x < 2 = x
    | otherwise = read (show (repBinaria (x `div` 2)) ++ show (x `mod` 2))

posicoes'' :: String -> Char -> Int
posicoes'' [] _ = 0
posicoes'' (x:xs) a = (if x == a then 1 else 0) + posicoes'' xs a

odioso :: Int -> Bool
odioso x = (posicoes'' (show (repBinaria x)) '1') `mod` 2 == 1
