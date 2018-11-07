-- ex 5 a ex 9

-- ex 5
data Tree a = EmptyTree | Node (Tree a) a (Tree a)

-- ex 7
instance Eq a => Eq (Tree a) where
    EmptyTree == (Node _ _ _) = False
    (Node _ _ _) == (EmptyTree) = False
    EmptyTree == EmptyTree = True
    (Node l1 y1 r1) == (Node l2 y2 r2) = flatten (Node l1 y1 r1) == flatten (Node l2 y2 r2)

-- ex 8
instance Show a => Show (Tree a) where
    show = toString 0

-- ex 9
instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node l y r) = Node (fmap f l) (f y) (fmap f r)

singleton :: a -> Tree a
singleton x = Node EmptyTree x EmptyTree

insert :: Ord a => a -> Tree a -> Tree a
insert x EmptyTree = singleton x
insert x (Node l y r)
        | x == y = Node l y r
        | x < y = Node (insert x l) y r
        | otherwise = Node l y (insert x r)

empty :: Tree a
empty = EmptyTree

fromList :: Ord a => [a] -> Tree a
fromList = foldr insert EmptyTree

size :: Tree a -> Int
size (EmptyTree) = 0
size (Node l _ r) = 1 + (size l) + (size r)

depth :: Tree a -> Int
depth (EmptyTree) = 0
depth (Node l y r) = 1 + max (depth l) (depth r)

flatten :: Tree a -> [a]
flatten EmptyTree = []
flatten (Node l y r) = [y] ++ flatten l ++ flatten r

isFull :: Tree a -> Bool
isFull EmptyTree = True
isFull (Node l _ r) = size l == size r && isFull l && isFull r

invert :: Tree a -> Tree a
invert EmptyTree = EmptyTree
invert (Node l y r) = Node (invert r) y (invert l)

makeTree :: Ord a => [a] -> Tree a
makeTree [] = EmptyTree
makeTree (x: xs) = Node (fromList $ take ((length xs) `div` 2) xs) x (fromList $ drop ((length xs) `div` 2) xs)

-- ex6

fold' :: b -> (b -> a -> b -> b) -> Tree a -> b
fold' e _ EmptyTree = e
fold' e f (Node l x r) = f (fold' e f l) x (fold' e f r)

size' :: Tree a -> Int
size' (EmptyTree) = 0
size' (Node l x r) = fold' 0 (\x y z -> x + z + 1) (Node l x r)

depth' :: Tree a -> Int
depth' EmptyTree = 0
depth' (Node l x r) = fold' 0 (\x y z -> (max x z) + 1) (Node l x r)

flatten' :: Tree a -> [a]
flatten' EmptyTree = []
flatten' (Node l x r) = fold' [] (\x y z -> y : (x ++ z)) (Node l x r)

isFull' :: Tree a -> Bool
isFull' EmptyTree = True
isFull' (Node l x r) = size' l == size' r && isFull' l && isFull' r

-- invert' :: Tree a -> Tree a
-- invert' EmptyTree = EmptyTree
-- invert' (Node l y r) = fold' EmptyTree (\x y z -> Node (invert' x) y (invert' z)) (Node l y r)

-- makeTree' :: Ord a => [a] Tree a
-- makeTree [] = EmptyTree

-- ex 8
toString :: Show a => Int -> Tree a -> String
toString depth EmptyTree = replicate depth ' ' ++ "Empty"
toString depth (Node l y r) = replicate depth ' ' ++ (show y) ++ "\n" ++ (toString (depth + 1) l) ++ "\n" ++ (toString (depth + 1) r)
