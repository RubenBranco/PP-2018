-- 1 a b; 2; 4 a b
import Test.QuickCheck
import Data.List
import Control.Monad

-- 1 a
prop_even_odd :: Int -> Property
prop_even_odd x = even x ==> odd $ x + 1
-- 1 b
isPrime :: Int -> Bool
isPrime n = null [x | x <- [2..n-1], n `mod` x == 0]

mersenne_number :: Int -> Int
mersenne_number n = 2^n - 1

prop_mersenne_primes :: Int -> Property
prop_mersenne_primes n = isPrime n && n > 0 ==> isPrime $ mersenne_number n

-- 2
-- a
prop_length_reverse :: [a] -> Bool
prop_length_reverse xs = length (reverse xs) == length xs

-- b
prop_reverse_reverse :: Eq a => [a] -> Bool
prop_reverse_reverse xs = reverse (reverse xs) == xs

-- c
prop_permutation_reverse :: Eq a => [a] -> Bool
prop_permutation_reverse xs = reverse xs `elem` permutations xs

-- d
prop_ith_elem_reverse :: Eq a => [a] -> Bool
prop_ith_elem_reverse xs = not $ False `elem` [x == y | (x,y) <- zip xs $ reverse xs]

-- 4
-- a
data Point = P Int Int
data Shape = Circle Point Int | Rectangle Point Point | Triangle Point Point Point


instance Arbitrary Point where
    arbitrary = liftM2 P arbitrary arbitrary


instance Arbitrary Shape where
    arbitrary = oneof [liftM2 Circle arbitrary arbitrary, liftM2 Rectangle arbitrary arbitrary, liftM3 Triangle arbitrary arbitrary arbitrary]

-- b
