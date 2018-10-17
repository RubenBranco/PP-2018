-- 3abefhi 4 5 8c 9a

-- 3
-- a type: (Num a, Enum a) => [a] ; value: [2,3,4]
-- b type: [Bool]; value: [True, False, False, False]
-- c type: [String] value: ["As", "artes", "dos", "alunos"]
-- e type: [[Int]] value: [[1, 4], [9, 16, 25]]
-- f type: (Ord a) => [a] value: [6]
-- h type: (Ord a) => [a] value: [9, 4, 1, 1, 4, 9]
-- i type:

-- 4
zipWithRecursive' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithRecursive' f [] _ = []
zipWithRecursive' f _ [] = []
zipWithRecursive' f (x:xs) (y:ys) = f x y : zipWithRecursive' f xs ys

zipWithComprehension' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithComprehension' f xs ys = [f x y | (x,y) <- zip xs ys]

zip' :: [a] -> [b] -> [(a,b)]
zip' xs ys = zipWithRecursive' (,) xs ys

-- 5

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs)
            | p x = x : takeWhile' p xs
            | otherwise = []

-- 8c
total :: (Int -> Int) -> Int -> Int
total f n = sum (map f [0..n])

-- 9a
aplica :: [a -> a] -> [a] -> [a]
aplica [] xs = xs
aplica (f:fs) xs = aplica fs (map f xs)
