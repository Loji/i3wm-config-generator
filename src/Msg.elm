module Msg exposing (..)

import TileContainer.Msg as TileContainer


type Msg
    = ModifyTileContainer TileContainer.Msg Int
    | AddTileContainer Int
