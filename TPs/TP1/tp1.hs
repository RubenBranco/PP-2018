-- ex 1 a)
soma x y z = x + y + z

-- ex 1 b)
soma2 x y z = if minimum [x, y, z] > 0
                then soma x y z
                else 0

-- ex 2

diff x y z = if abs (x - y) < z
                then True
                else False

-- ex 3

addDigit x y = if x < 0
                then x * 10 - y
                else x * 10 + y

-- ex 4 a) 2 b) 2 c) 1 d) 2 e) 1 f) 0 g) 1 h) 2

-- ex 5

-- a

moreThanTen lst = if length lst > 10
                    then True
                    else False
-- b
emptyListCheck lst = null lst
-- c
firstAndLast str = (head str) ++ (last str)
-- d
secondItem lst = head (tail lst)
-- e
secondToLast lst = last (init lst)
-- f
nthItem lst idx = last (take (idx + 1) lst)
-- g
reverseButFirst lst = head lst : reverse (tail lst)
-- h
sumFive lst = sum (take 5 lst)
-- i
sumN n lst = sum (take n lst)
-- j
checkLastAndLength lst1 lst2 = last lst1 == last lst2 && length lst1 == length lst2

