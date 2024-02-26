{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Main where

import Control.Monad
import Data.List
import Data.Set
import Data.Text
import System.Environment
import System.IO
import Data.Maybe
import Data.IntMap as IM


lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack

rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

-- Solution: out of memory
-- ugh, it doesn't work with the custom input
-- printing the length of the array without sorting gets 7001

main :: IO ()
main = do
  stdout <- getEnv "OUTPUT_PATH"
  fptr <- openFile stdout WriteMode

  -- tTemp <- getLine
  -- 595 list is not that long...
  dataFile <- openFile "data/list.dat" ReadMode
  tTemp <- hGetLine stdin -- dataFile
  let t = read $ lstrip $ rstrip tTemp :: Int
  print t

  forM_ [1 .. t] $ \t_itr -> do
    nTemp <- hGetLine stdin -- dataFile
    let n = read $ lstrip $ rstrip nTemp :: Int
    print n

    arrTemp <- hGetLine stdin -- dataFile
    hPutStrLn fptr $ show arrTemp

    let arr = Data.List.map (read :: String -> Int) . Data.List.words $ rstrip arrTemp
    print $ Data.List.length arr

    let result = countInversions arr

    hPutStrLn fptr $ show result

  hFlush fptr
  hClose fptr
