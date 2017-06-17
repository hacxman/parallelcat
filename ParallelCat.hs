{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment
import Control.Concurrent.Async
import System.IO

reader handle = do
  c <- hGetContents handle
  hPutStr stdout c

main = do
  args <- getArgs
  thrds <- mapM (\fname -> async $ withBinaryFile fname ReadMode reader) args
  mapM_ wait thrds
