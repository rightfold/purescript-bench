module Main
( main
) where

import Benchmark (benchmark)
import Benchmark.Plot.Gnuplot (gnuplot)
import Control.Monad.Eff.Console (log)
import Data.List ((..), (:), List(..))
import Data.Set as Set
import Prelude

main = do
  let n = 10000
      list = 1 .. n
      set  = Set.fromFoldable list
  listMember <- benchmark pure \i -> pure $     member i list
  setMember  <- benchmark pure \i -> pure $ Set.member i set
  log $ "set terminal png\n"
  log $ gnuplot [ {title: "List member check", benchmark: listMember}
                , {title: "Set member check",  benchmark: setMember}
                ]
  pure unit

member :: forall a. (Eq a) => a -> List a -> Boolean
member _ Nil = false
member a (x : xs)
  | a == x = true
  | otherwise = member a xs
