module Benchmark
( Benchmark(..)
, benchmark
, benchmark'
) where

import Effect (Effect)

newtype Benchmark = Benchmark (Array Number)

benchmark
  :: forall a b
   . (Int -> Effect a)
  -> (a -> Effect b)
  -> Effect Benchmark
benchmark = benchmark' 50 1000

benchmark'
  :: forall a b
   . Int
  -> Int
  -> (Int -> Effect a)
  -> (a -> Effect b)
  -> Effect Benchmark
benchmark' = _benchmark'

foreign import _benchmark'
  :: forall a b
   . Int
  -> Int
  -> (Int -> Effect a)
  -> (a -> Effect b)
  -> Effect Benchmark
