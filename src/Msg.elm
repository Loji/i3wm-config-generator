module Msg exposing (..)

import TileContainer.Msg as TileContainer


type Msg
    = MsgForTileContainer TileContainer.Msg Int
