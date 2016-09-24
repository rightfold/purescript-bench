module Benchmark
( BENCHMARK
, Benchmark(..)
, benchmark
, benchmark'
) where

import Control.Monad.Eff (Eff)
import Prelude

foreign import data BENCHMARK :: !

newtype Benchmark = Benchmark (Array Number)

benchmark
  :: forall eff a
   . (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
benchmark = benchmark' 50 1000

benchmark'
  :: forall eff a
   . Int
  -> Int
  -> (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
benchmark' = _benchmark'

foreign import _benchmark'
  :: forall eff a
   . Int
  -> Int
  -> (Int -> Eff (benchmark :: BENCHMARK | eff) a)
  -> Eff (benchmark :: BENCHMARK | eff) Benchmark
