import Data.Char

fromString :: String -> [(Char,Int)]
fromString xs = map (\x -> (fst x, digitToInt$snd x))$filter (\x -> not (isDigit$fst x)) (zip xs (tail xs))

fromNotes :: [(Char,Int)] -> [Double]
fromNotes = map (noteFrequency)

noteFrequency :: (Char, Int) -> Double
noteFrequency (note, octave) = 440 * 2 ** (fromIntegral (midiCode (note, octave) - midiCode ('A', 4)) / fromIntegral 12)

midiCode :: (Char, Int) -> Int
midiCode (note, octave) = octave * 12 - (index note (reverse"CcDdEFfGgAaB")) + 23

index :: (Eq a) => a -> [a] -> Int
index el xs = snd$head (filter (\x -> (fst x) == el) (zip xs [0..(length xs)]))

notesBelow :: Double -> [(Char,Int)] -> [(Char,Int)]
notesBelow freq = filter (\x -> noteFrequency x < freq)
