{-# LANGUAGE ForeignFunctionInterface #-}

module Foo (foo) where

foreign import ccall unsafe "cabal_test_foo.h foo_impl" foo
  :: Int
  -> IO Int
