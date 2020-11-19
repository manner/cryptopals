module Challenge1.ConvertHexToBase64 where

import Data.ByteString
import qualified Data.ByteString.Base64 as Base64
import qualified Data.ByteString.Base16 as Hex

hexToBase :: ByteString -> ByteString
hexToBase = Base64.encode . fst. Hex.decode