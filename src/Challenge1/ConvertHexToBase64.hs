module Challenge1.ConvertHexToBase64 where

import Data.ByteString.Lazy
import qualified Data.ByteString.Base64.Lazy as Base64
import qualified Data.ByteString.Base16.Lazy as Hex

hexToBase :: ByteString -> ByteString
hexToBase = Base64.encode . hexToByte

base64ToBytes :: ByteString -> ByteString
base64ToBytes = Base64.decodeLenient 

hexToByte :: ByteString -> ByteString
hexToByte = fst . Hex.decode

byteToHex :: ByteString -> ByteString
byteToHex = Hex.encode