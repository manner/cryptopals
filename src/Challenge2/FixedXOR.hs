module Challenge2.FixedXOR where

import Data.ByteString.Lazy
import Challenge1.ConvertHexToBase64 (hexToByte, byteToHex)
import qualified Data.Bits as Bits

xor :: ByteString -> ByteString -> ByteString
xor a b = byteToHex $ pack $ Data.ByteString.Lazy.zipWith Bits.xor aBS bBS
    where 
        aBS = hexToByte a
        bBS = hexToByte b 