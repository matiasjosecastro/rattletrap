{-# LANGUAGE TemplateHaskell #-}

module Rattletrap.Type.KeyFrame
  ( KeyFrame(..)
  ) where

import Rattletrap.Type.Common
import Rattletrap.Type.Float32le
import Rattletrap.Type.Word32

data KeyFrame = KeyFrame
  { keyFrameTime :: Float32le
  -- ^ When this key frame occurs, in seconds.
  , keyFrameFrame :: Word32
  -- ^ The frame number of this key frame, starting from 0.
  , keyFramePosition :: Word32
  -- ^ The bit position of this key frame in the stream.
  } deriving (Eq, Ord, Show)

$(deriveJson ''KeyFrame)
