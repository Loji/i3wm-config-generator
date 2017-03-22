module Msg exposing (..)

import Tile.Msg as Tile


type Msg
    = ModifyTile Tile.Msg Int
    | AddTile Int
