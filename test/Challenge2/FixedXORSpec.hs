{-# LANGUAGE OverloadedStrings #-}

module Challenge2.FixedXORSpec (spec) where

import Test.Hspec
import Data.ByteString.Char8 (pack)
import Challenge2.FixedXOR

spec :: Spec
spec = do
  describe "FixedXOR" $ do
    it "xors two hex values and returns hex value" $
      "1c0111001f010100061a024b53535009181c" `xor` "686974207468652062756c6c277320657965" `shouldBe` "746865206b696420646f6e277420706c6179"

    

