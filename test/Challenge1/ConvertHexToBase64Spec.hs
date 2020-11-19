{-# LANGUAGE OverloadedStrings #-}

module Challenge1.ConvertHexToBase64Spec (spec) where

import Test.Hspec
import Data.ByteString.Char8 (pack)
import Challenge1.ConvertHexToBase64

spec :: Spec
spec = do
  describe "ConvertHexToBase64" $ do
    it "converts a hex input to Base64" $
      hexToBase "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d" `shouldBe` "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    

