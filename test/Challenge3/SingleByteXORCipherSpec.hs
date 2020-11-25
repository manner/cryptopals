{-# LANGUAGE OverloadedStrings #-}

module Challenge3.SingleByteXORCipherSpec (spec) where

import Test.Hspec
import Challenge1.ConvertHexToBase64
import Challenge3.SingleByteXORCipher

spec :: Spec
spec = do
  describe "SingleByteXORCipher" $ do
    it "find correct text from cipher text which has been xored with single byte" $
      decrypt (hexToByte "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736") `shouldBe` ('X', "Cooking MC's like a pound of bacon")

    

