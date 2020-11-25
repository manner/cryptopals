{-# LANGUAGE OverloadedStrings #-}
module Challenge3.SingleByteXORCipher where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.Char8 as C8
import qualified Data.Map as Map 
import Data.Word
import Data.Char (toUpper)
import Data.Bits (xor)
import Challenge1.ConvertHexToBase64 (hexToByte, byteToHex)

hexAlpha :: [Word8] 
hexAlpha = map charToWord [' '..'~']

decryptSingleXOR :: BL.ByteString -> [(Char, BL.ByteString)]
decryptSingleXOR chiffre = map xorChiffre hexAlpha
    where xorChiffre key = (toEnum $ fromEnum key, BL.map (xor key) chiffre)
          
scores = Map.fromList scoreTuples
    where scoreTuples = zip highestFrequencyLetters [15,13,13,9,8,8,7,7,6,6,6,4,4,3]
          highestFrequencyLetters = " ETAOINSHRDLC" 

lookupScore :: Int -> Char -> Int
lookupScore current key = case Map.lookup cleanKey scores of
        Nothing -> current
        Just value -> current + value
    where cleanKey = toUpper key

calcScore :: BL.ByteString -> Int
calcScore text = foldl lookupScore 0 (C8.unpack text)

decrypt :: BL.ByteString -> (Char, BL.ByteString)
decrypt text = allPossibilites !! max
    where allPossibilites = decryptSingleXOR text
          max = maxIndex $ map (calcScore . snd) allPossibilites

maxIndex :: Ord a => [a] -> Int
maxIndex xs = head $ filter ((== maximum xs) . (xs !!)) [0..]

charToWord :: Char -> Word8
charToWord = toEnum . fromEnum