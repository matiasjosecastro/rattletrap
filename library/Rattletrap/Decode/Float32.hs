module Rattletrap.Decode.Float32
  ( getFloat32
  , getFloat32Bits
  ) where

import Rattletrap.Type.Float32
import Rattletrap.Utility

import qualified Data.Binary as Binary
import qualified Data.Binary.Bits.Get as BinaryBit
import qualified Data.Binary.Get as Binary
import qualified Data.Binary.IEEE754 as IEEE754

getFloat32 :: Binary.Get Float32
getFloat32 = do
  float32 <- IEEE754.getFloat32le
  pure (Float32 float32)

getFloat32Bits :: BinaryBit.BitGet Float32
getFloat32Bits = do
  bytes <- BinaryBit.getLazyByteString 4
  pure (Binary.runGet getFloat32 (reverseBytes bytes))
