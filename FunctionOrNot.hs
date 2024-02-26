{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Main where

import Control.Monad
import Data.List
import Data.Text hiding (strip)
import System.IO
import Data.IntMap as IM

strip :: String -> String
strip = Data.Text.unpack . Data.Text.stripStart . Data.Text.stripEnd . Data.Text.pack

-- https://www.hackerrank.com/challenges/functions-or-not/problem
isFunction :: [(Int,Int)] -> IM.IntMap Int -> Bool
isFunction [] _ = True
isFunction ((x,y):xys) funcMap =
  case IM.lookup x funcMap of
    Nothing -> isFunction xys (IM.insert x y funcMap)
    Just z -> (y == z) && isFunction xys funcMap

main :: IO ()
main = do
  -- dataFile <- openFile "data/list.dat" ReadMode
  tTemp <- hGetLine stdin -- dataFile
  let t = read $ strip tTemp :: Int

  forM_ [1 .. t] $ \t_itr -> do
    nTemp <- hGetLine stdin -- dataFile
    let n = read $ strip nTemp :: Int

    xys <- forM [1 .. n] $ \n_itr -> do
      arrTemp <- hGetLine stdin -- dataFile
      let arr = Data.List.map (read :: String -> Int) . Data.List.words $ strip arrTemp
      case arr of
        [x,y] -> return (x,y)
        _ -> error $ "failed to parse " <> show arr
    putStrLn $ if isFunction xys IM.empty then "YES" else "NO"

