module Model exposing (..)

import Tile.Model as Tile
import Controls.Model as Controls


type alias Model =
    { tiles : Tile.ChildTiles
    , controls : Controls.Model
    , lastTileId : Int
    }


initialModel : Model
initialModel =
    { tiles = Tile.ChildTiles [ Tile.model ]
    , controls = Controls.model
    , lastTileId = 0
    }
