module Challenge6.DecryptRepeatingXOR where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.UTF8 as BLU
import qualified Data.Bits as B
import Data.List (sortBy) 
import Challenge1.ConvertHexToBase64 (base64ToBytes, byteToHex, hexToByte)
import Challenge3.SingleByteXORCipher (decrypt)
import Challenge5.RepeatingKeyXOR 

type KeySize = Int
type HammingDistance = Float
type HammingTuple = (KeySize, HammingDistance)

keySizes :: [KeySize]
keySizes = [2..40]

filename = "src/Challenge6/encrypted.txt"

hamming :: BL.ByteString -> BL.ByteString -> Int
hamming a b = (sum . map B.popCount) xored
    where xored = BL.zipWith B.xor a b

detect :: IO ()
detect = do
    contents <- BL.readFile filename
    let cipher = base64ToBytes contents
    let keys = map BLU.fromString $ findKeys cipher
    print keys
    print $ map (hexToByte . (xor cipher)) keys


hammingDistanceForKeysize :: BL.ByteString -> KeySize -> HammingTuple
hammingDistanceForKeysize cipher keySize = (keySize, normalizedHammingDistance)
    where normalizedHammingDistance = (fromIntegral hammingDistance) / (fromIntegral (4*keySize))
          hammingDistance = hamming firstBytes secondBytes
          firstBytes = BL.take keySize64 cipher
          secondBytes = (BL.take keySize64 . BL.drop keySize64) cipher
          keySize64 = fromIntegral (4*keySize)

minHammingDistance :: BL.ByteString -> [HammingTuple]
minHammingDistance cipher = take 1 sortedHammingTuples
    where sortedHammingTuples = sortBy (\a b -> snd a `compare` snd b) hammingTuples
          hammingTuples = map (hammingDistanceForKeysize cipher) keySizes

groupAndTranspose :: BL.ByteString -> [[BL.ByteString]]
groupAndTranspose cipher = map BL.transpose groups
    where groups = map (group cipher) ns
          ns = map fst $ minHammingDistance cipher

findKeys :: BL.ByteString -> [String]
findKeys cipher = map (map (fst . decrypt)) groups
    where groups = groupAndTranspose cipher

group :: BL.ByteString -> Int -> [BL.ByteString]
group b n 
    | BL.length b == 0 = []
    | n > 0 = BL.take n64 b : group (BL.drop n64 b) n
    | otherwise = error "Negative or zero n"
    where n64 = fromIntegral n