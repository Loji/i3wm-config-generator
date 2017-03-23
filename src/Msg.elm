module Msg exposing (..)

import Tile.Msg as Tile
import Controls.Msg as Controls


type Msg
    = ModifyTile Tile.Msg Int
    | AddTile Int
    | ModifyControls Controls.Msg
