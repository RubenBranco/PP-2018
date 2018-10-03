-- II Tipos e classes de tipos

-- 1
-- a) (Float, Float, Float)
-- b) Num
-- c) [Float]
-- d) (String, Int, [String])
-- e) [(String, Int, [String])]
-- f) [String]
-- g) [[String]]

-- 2
-- a) False
-- b) GT
-- c) "True or False"
-- d) "\"As armas e os baroes\""
-- e) True
-- f) True
-- g) [False, True]
-- h) []
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
somaVec :: (Double,Double)-> (Double, Double)-> (Double,Double)
somaVec (x1, y1) (x2,y2) = (x1 + x2, y1 + y2)

-- 5
quadranteComplexo :: (Double, Double) -> Int
quadranteComplexo (r, i) = 

