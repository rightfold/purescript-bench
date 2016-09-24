module Benchmark.Plot.Gnuplot
( gnuplot
) where

import Benchmark (Benchmark)
import Prelude

gnuplot :: Array {title :: String, benchmark :: Benchmark} -> String
gnuplot = _gnuplot

foreign import _gnuplot :: Array {title :: String, benchmark :: Benchmark} -> String
