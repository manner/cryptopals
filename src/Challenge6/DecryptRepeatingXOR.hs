module Challenge6.DecryptRepeatingXOR where

import qualified Data.ByteString.Lazy as BL
import qualified Data.Bits as B

hamming :: BL.ByteString -> BL.ByteString -> Int
hamming a b = (sum . map B.popCount) xored
    where xored = BL.zipWith B.xor a b