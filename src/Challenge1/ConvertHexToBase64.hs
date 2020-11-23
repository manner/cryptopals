module Challenge1.ConvertHexToBase64 where

import Data.ByteString.Lazy
import qualified Data.ByteString.Base64.Lazy as Base64
import qualified Data.ByteString.Base16.Lazy as Hex

hexToBase :: ByteString -> ByteString
hexToBase = Base64.encode . hexToByte

hexToByte :: ByteString -> ByteString
hexToByte = fst . Hex.decode

byteToHex :: ByteString -> ByteString
byteToHex = Hex.encode