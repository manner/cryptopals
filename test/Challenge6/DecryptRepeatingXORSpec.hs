{-# LANGUAGE OverloadedStrings #-}
module Challenge6.DecryptRepeatingXORSpec (spec) where

import Test.Hspec
import Challenge6.DecryptRepeatingXOR

spec :: Spec
spec = do
  describe "Decrypt cipher" $ do
    it "correctly calculates bit hamming distance" $
      hamming "this is a test" "wokka wokka!!!" `shouldBe` 37