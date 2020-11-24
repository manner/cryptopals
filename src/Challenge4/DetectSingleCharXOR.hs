module Challenge4.DetectSingleCharXOR where

import Data.ByteString.Lazy as BL
import Data.ByteString.Lazy.UTF8 as BLU
import Challenge3.SingleByteXORCipher (decrypt)

filename = "src/Challenge4/encrypted.txt"

detect :: IO ()
detect = do
    contents <- BL.readFile filename
    let lines =  BLU.lines contents
    mapM_ (print . decrypt) lines 