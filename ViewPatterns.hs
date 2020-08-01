{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE LambdaCase #-}

import Data.Char
import Data.Maybe
import qualified Data.Map as M

type HaskellPackage = String

lensDownloadsOld :: M.Map HaskellPackage Int -> Int
lensDownloadsOld packages =
  case M.lookup "lens" packages of
    Just n -> n
    Nothing -> 0

lensDownloads :: M.Map HaskellPackage Int -> Int
lensDownloads (M.lookup "lens" -> Just n) = n
lensDownloads _                           = 0

-- Unlike case, can use different funcs in each pattern match
experiment :: String -> Bool
experiment (length -> 4) = True
experiment (map toUpper -> "HELLO") = False
experiemtn _ = True

-- A way of achieving something similar with LambdaCase
lensDownloadsLambdaCase :: M.Map HaskellPackage Int -> Int
lensDownloadsLambdaCase = M.lookup "lens" & \case
  Just n -> n
  Nothing -> 0
  where
    (&) = flip (.)

-- In this instance, fromMaybe is probably clearest of all though
lensDownloadsFromMaybe :: M.Map HaskellPackage Int -> Int
lensDownloadsFromMaybe = fromMaybe 0 . M.lookup "lens"
