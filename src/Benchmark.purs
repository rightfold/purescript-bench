module Benchmark
( BENCHMARK
, Benchmark(..)
, benchmark
, benchmark'
) where

import Control.Monad.Eff (Eff, kind Effect)

foreign import data BENCHMARK :: Effect

newtype Benchmark = Benchmark (Array Number)

benchmark
  :: forall eff a b
   . (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> (a -> Eff (benchmark :: BENCHMARK | eff) b)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
benchmark = benchmark' 50 1000

benchmark'
  :: forall eff a b
   . Int
  -> Int
  -> (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> (a -> Eff (benchmark :: BENCHMARK | eff) b)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
benchmark' = _benchmark'

foreign import _benchmark'
  :: forall eff a b
   . Int
  -> Int
  -> (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> (a -> Eff (benchmark :: BENCHMARK | eff) b)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
