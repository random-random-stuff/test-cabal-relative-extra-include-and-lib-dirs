module ExeMain (main) where

import Foo (foo)

main :: IO ()
main = do
  print =<< foo 0
  pure ()

