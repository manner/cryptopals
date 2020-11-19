module Challenge1.ConvertHexToBase64Spec (spec) where

import Test.Hspec
import Challenge1.ConvertHexToBase64

spec :: Spec
spec = do
  describe "ConvertHexToBase64" $ do
    it "returns the original number when given a positive input" $
      double 4 `shouldBe` 8

    

