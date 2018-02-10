module Main where

import Prelude

import Control.Monad.Eff.Uncurried (mkEffFn1)
import React.Basic as R
import MyComponent (component)

type Props = { }

app :: R.ReactComponent
app = R.react
  { render }
  where
    render = component { someProp }

