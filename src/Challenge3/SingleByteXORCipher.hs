{-# LANGUAGE OverloadedStrings #-}
module Challenge3.SingleByteXORCipher where

import Data.ByteString.Lazy
import Data.ByteString.Lazy.Char8 as C8
import Data.Word
import Data.Map
import Data.Char
import Data.Bits (xor)
import Challenge1.ConvertHexToBase64 (hexToByte, byteToHex)

hexAlpha :: [Word8] 
hexAlpha = Prelude.map (toEnum . fromEnum) ['a'..'z']

decryptSingleXOR :: ByteString -> [ByteString]
decryptSingleXOR c = Prelude.map xorChiffre hexAlpha 
    where chiffre = hexToByte c
          xorChiffre key = Data.ByteString.Lazy.map (xor key) chiffre
          
scores = Data.Map.fromList scoreTuples
    where scoreTuples = Prelude.zip highestFrequencyLetters [1..]
          highestFrequencyLetters = Prelude.reverse "etaoinshrdlcumwfgypbvkjxqz" --"ETAOINSHRDLU" 

lookupScore :: Integer -> Char -> Integer
lookupScore current k = case Data.Map.lookup cleanKey scores of
        Nothing -> current
        Just value -> current + value
    where cleanKey = Data.Char.toLower k

calcScore :: ByteString -> Integer
calcScore text = Prelude.foldl lookupScore 0 (C8.unpack text)

decrypt text = allPossibilites !! max
    where allPossibilites = decryptSingleXOR text
          max = maxIndex $ Prelude.map calcScore allPossibilites
-- decryptSingleXOR $ byteToHex "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

maxIndex xs = Prelude.head $ Prelude.filter ((== Prelude.maximum xs) . (xs !!)) [0..]