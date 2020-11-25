{-# LANGUAGE OverloadedStrings #-}
module Challenge6.DecryptRepeatingXORSpec (spec) where

import Test.Hspec
import qualified Data.ByteString.Lazy as BL
import Challenge1.ConvertHexToBase64 (base64ToBytes)
import Challenge6.DecryptRepeatingXOR

spec :: Spec
spec = do
  describe "Decrypt cipher" $ do
    it "correctly calculates bitstac hamming distance" $
      hamming "this is a test" "wokka wokka!!!" `shouldBe` 37
    it "finds key for repeating cipher" $ do 
      contents <- BL.readFile filename
      let cipher = base64ToBytes contents
      findKeys cipher `shouldBe` ["Terminator X: Bring the noise"]