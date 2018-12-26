-- 1

{-
c
    length (mep f xs) = length xs
    map f xs $ !! n = f (xs !! n)
e
    length $ take n xs = min n (length xs)
    take n xs $ !! n = xs !! n para todo n tq 0 < n < length xs
-}

-- 3

{-
c
    reverse [x] = [x] (=)
    reverse [] ++ [x] (=) R/2
    [] ++ [x] (=)   R/1
    [x]
-}

-- 4

{-
b
    [] ++ ys = ys
    (x:xs) ++ ys = x : (xs ++ ys)

    ys ++ [] = ys ++/1

    ys ++ []
        caso 1:  ys é []
            [] ++ [] = [] ++/1
        caso 2 : ys não é vazio
            (y : ys') ++ [] (=) ++/2
            y : (ys' ++ []) (=) HI
            CERTO: (y : ys') (=) ys
            ys : ([] ++ []) (=) => caso 1
            ys : [] (=)
            ys
-}

-- 8

{-
b
    drop 0 xs = xs
    drop _ [] = []
    drop n (x:xs) = drop (n -1) xs
    f . g x = f (g x)

    (drop m . drop n) xs = drop (m + n) xs

    caso 1: xs = []
        LADO ESQUERDO
            (drop m . drop n) [] (=)
            drop m (drop n []) (=) ./1
            drop m [] (=)
            [] drop/2
        LADO DIREITO
            drop (m + n) [] (=)
            []  drop/2

    caso 2: xs = (x:xs')
        (drop m . drop n) (x:xs') (=)
        drop m (drop n (x:xs')) (=) ./1
        drop m (drop (n-1) xs') (=) drop/3
        drop m .

        drop (m + n) (drop 0 xs)
        (drop (m + n) . drop 0) xs



-}
