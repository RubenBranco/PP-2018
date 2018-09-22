-- ex 1 a)
soma x y z = x + y + z
-- ex 1 b)
soma2 x y z = if minimum [x, y, z] > 0
                then soma x y z
                else 0
-- ex 2
diff x y z = abs (x - y) < z
-- ex 3
addDigit x y = if x < 0
                then x * 10 - y
                else x * 10 + y
-- ex 4 a) 2 b) 1 c) 1 d) 2 e) 1 f) 0 g) 1 h) 2
-- ex 5
-- a
moreThanTen xs = length xs > 10
-- b
emptyListCheck xs = null xs
-- c
firstAndLast str = (head str) ++ (last str)
-- d
secondItem xs = head (tail xs)
-- e
secondToLast xs = last (init xs)
-- f
nthItem xs idx = last (take (idx + 1) xs)
-- g
reverseButFirst [x:xs] = xs : reverse xs
-- h
sumFive xs = sum (take 5 xs)
-- i
sumN n xs = sum (take n xs)
-- j
checkLastAndLength xs1 xs2 = last xs1 == last xs2 && length xs1 == length xs2
-- ex 6
--a
isSuffix xs1 xs2 = drop ((length xs2) - (length xs1)) xs2 == xs1
-- b
isPrefix xs1 xs2 = take (length xs1) xs2 == xs1
-- c
isSuffixOrPrefix xs1 xs2 = isSuffix xs1 xs2 || isPrefix xs1 xs2
