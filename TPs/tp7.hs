module Map
( Map
, empty
, singleton
, insert
, lookup'
, null'
) where
import Data.Maybe
data Map k a = M [(k, a)] deriving (Show)

empty :: Map k a
empty = M []

singleton :: k -> a -> Map k a
singleton k v = M [(k, v)]

insert :: Ord k => k -> a -> Map k a -> Map k a
insert k v (M xs) = M ((k, v) : (filter (\x -> (fst x) /= k) xs))

member :: Ord k => k -> Map k a -> Bool
member k (M xs) = isJust (lookup' k (M xs))

null' :: Map k a -> Bool
null' (M xs) = size (M xs) == 0

size :: Map k a -> Int
size (M (xs)) = length xs

lookup' :: Ord k => k -> Map k a -> Maybe a
lookup' k (M []) = Nothing
lookup' k (M (x: xs))
        | (fst x) == k = Just (snd x)
        | otherwise = lookup' k (M xs)

delete :: Ord k => k -> Map k a -> Map k a
delete k (M (xs)) = M (filter (\x -> (fst x) /= k) xs)

-- unionWith :: Ord k => (a -> a -> a) -> Map k a -> Map k a -> Map k a
-- unionWith f (M (xs)) (M (ys)) = M

fromList :: Ord k => [(k, a)] -> Map k a
fromList xs = M xs

toList :: Map k a -> [(k, a)]
toList (M (xs)) = xs
