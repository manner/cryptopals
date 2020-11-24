{-# LANGUAGE OverloadedStrings #-}
module Challenge5.RepeatingKeyXOR where

import qualified Data.ByteString.Lazy as BL    
import qualified Data.Bits as Bits
import Challenge1.ConvertHexToBase64 (byteToHex)

xor :: BL.ByteString -> BL.ByteString -> BL.ByteString
xor a b = byteToHex $ BL.pack $ BL.zipWith Bits.xor a repeatingKey
    where repeatingKey = BL.cycle b
