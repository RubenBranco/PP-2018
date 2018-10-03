import Data.Char

-- II Tipos e classes de tipos

-- 1
-- a) (Int, Int, Int)
-- b) Num
-- c) [(Int, Int)]
-- d) (String, Int, [String, Int])
-- e) [(String, Int, [String, Int])]
-- f) [String]
-- g) [[String]]

-- 2
-- a) False
-- b) GT
-- c) "True or False"
-- d) "\"As armas e os baroes\""
-- e) True CORRECTION Error
-- f) True
-- g) [False, True]
-- h) [] INTERPRETAÇÃO ir de 1 para 0 (True, False), portanto conjunto vazio
-- i) 5.5
-- j) 5.5
-- k) 5.5

-- III A sintaxe das funções
-- 1, 2, 4 e 5

-- 1
ex1a (x, _) = x
ex1b (x, y) = (y, x)
ex1c (x, _, _) = x
ex1d (x, y, z) = (y, x, z)
ex1e (_:x:_) = x
ex1f ((_,x):_) = x

-- 2
somaVec :: (Double,Double) -> (Double, Double) -> (Double,Double)
somaVec (x1, y1) (x2,y2) = (x1 + x2, y1 + y2)

-- 5
quadranteComplexo :: (Double, Double) -> Int
quadranteComplexo (r, i)
    | r >= 0 && i >= 0 = 1
    | r >= 0 && i < 0 = 2
    | r < 0 && i < 0 = 3
    | otherwise = 4

-- 6
ordinalPrefix n
    | resto == 1 && n /= 11 = show n ++ "st"
    | resto == 2 && n /= 12 = show n ++ "nd"
    | resto == 3 && n /= 13 = show n ++ "rd"
    | otherwise = show n ++ "th"
    where resto = n `mod` 10

-- 7
leetSpeak xs = [convert x | x <- xs]
    where convert 'a' = '4'
          convert 'i' = '1'
          convert 't' = '7'
          convert 's' = '5'
          convert 'e' = '3'
          convert 'o' = 'O'
          convert x = toUpper x

-- 8
safetaila xs = if null xs == 0 then [] else tail xs

safetailb xs
    | (null xs) = []
    | otherwise = tail xs

safetailc (_:xs) = xs
safetailc () = []
