-- ex 10-13 & 17-21

{- 10
(a) type: Num a => a -> a ; value: ?
(b) type: Int -> Int ; value: 7
(c) type: (Num a, Ord a) => a -> Bool ; value: ?
(d) type: (Num a) => a -> a -> a ; value: ?
(e) type: (Num a) => a -> a ; value: ?
(f) type: Int -> Int -> Int ; value: 10
(g) type: (Num a) => a -> a -> a
(h) type: (a -> a) -> a -> a
(i) type: (Num a) => a -> a
-}
-- 11 (\x y z -> x * y * z)
{- 12
(++) = \xs ys -> xs ++ ys :t = [a] -> [a] -> [a]
(++[1,2]) = \xs -> xs ++ [1,2] :t = [a] -> [a]
([1,2]++) = \xs -> [1,2] ++ xs :t [a] -> [a]
-}
-- 13 (\x -> not (x `elem` [' ', '\t', '\n']))
-- 17
map' :: (a -> a) -> [a] -> [a]
map' f = foldr (\x acc -> f x : acc) []
filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> (if f x then x : acc else acc)) []
-- 18
binary2decimal :: [Int] -> Int
binary2decimal = foldl (\acc x -> x + acc * 2) 0
-- 19
poly :: Int -> [Int] -> Int
poly n = foldl (\acc x -> x + acc * n) 0
-- 20
aplica :: [a -> a] -> [a] -> [a]
aplica fs xs = foldr (\x acc -> (foldl (\acc f -> f acc) x fs) : acc) [] xs
-- aplica fs = map ( foldr (.) id (reverse fs))
-- aplica fs = map (foldl (flip (.)) id fs)
-- 21
selectApply :: (a -> b)-> (a -> Bool)-> [a] -> [b]
selectApply f1 f2 xs = map f1 (filter f2 xs)

-- 22
gz ::  [[Int]] -> [[Bool]]
gz xs = (map . map) (>0) xs

-- 23
iterRecursive f 0 = f -- id
iterRecursive f n = f . iterRecursive f (n - 1)
iterFoldr f n = foldr (\_ acc -> f . acc) f [0..(n - 1)]
-- foldr (.) id (replicate n f)
