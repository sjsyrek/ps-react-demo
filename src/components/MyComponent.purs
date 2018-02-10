module Main where

import Prelude

import Control.Monad.Eff.Uncurried (mkEffFn1)
import React.Basic as R

type Props =
  { label :: String
  }

type State =
  { counter :: Int
  }

component :: R.ReactComponent Props
component = R.react
  { initialState
  , render
  }
  where
    initialState _ = { counter: 0 }
    render { label } { counter } setState =
      R.button
        { onClick: mkEffFn1 \_ -> do
            setState { counter: counter + 1 }
        }
        [ R.text (label <> ": " <> show counter)
        ]
