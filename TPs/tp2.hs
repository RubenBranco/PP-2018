-- 8, 9, 11, 12, 13 e 16

-- ex 7
particao min max n = [min, min + ((max-min)/n) .. max]

-- ex8
-- a [2, 4, 6]
-- b [4, 16, 36, 64]
-- c "6789"
-- d [(1, 1), (1, 2), (1, 3), (3, 1), (3, 2), (3, 3)]
-- e [(1, 1), (1, 2), (1, 3), (3, 1), (3, 2), (3, 3)]

-- ex 9
ex9 = sum [x^2 | x <- [1..100]]

-- ex 11
-- a
fatores n = [x | x <- [1..n-1], n `mod` x == 0]
-- b
perfeitos n = [x | x <- [1..n], sum (fatores x) == x ]

-- ex 12
ex12 = [x^2 | x <- [0..]]

-- ex 13
produtoEscalar xs ys = sum [x * y | (x,y) <- zip xs ys]

-- ex 14
reproduz xs = concat [replicate x x | x <- xs]

-- ex 15
ex15 = concat [[(x,y) | y <- [4,5,6]] | x <- [1,2,3]]

-- ex 16
-- a Y
-- b Y
-- c N
-- d Y
-- e Y
-- f Y
-- g Y
-- h Y
-- i N
