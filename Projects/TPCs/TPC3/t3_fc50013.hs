import Data.Char
import Data.List

zipTuple :: ([Char], [Char]) -> [(Char, Char)]
zipTuple (xs, ys) = zip xs ys

fromString :: String -> [(Char, Int)]
fromString xs = map (\x -> (fst x, digitToInt $ snd x)) $ zipTuple $ partition (\x -> not (isDigit x)) xs

fromNotes :: [(Char,Int)] -> [Double]
fromNotes = map (noteFrequency)

noteFrequency :: (Char, Int) -> Double
noteFrequency (note, octave) = 440 * 2 ** (fromIntegral (midiCode (note, octave) - midiCode ('A', 4)) / fromIntegral 12)

midiCode :: (Char, Int) -> Int
midiCode (note, octave) = octave * 12 + head (note `elemIndices` "CcDdEFfGgAaB") + 23

notesBelow :: Double -> [(Char,Int)] -> [(Char,Int)]
notesBelow freq = filter (\x -> noteFrequency x < freq)

averageFrequency :: [(Char,Int)] -> Double
averageFrequency xs = foldl (\acc x -> (noteFrequency x) + acc) 0 xs / fromIntegral (length xs)
