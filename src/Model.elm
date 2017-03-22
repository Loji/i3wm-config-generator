module Model exposing (..)

import Tile.Model as Tile


type alias Model =
    { tiles : Tile.ChildTiles
    , lastTileId : Int
    }


initialModel : Model
initialModel =
    { tiles = Tile.ChildTiles [ Tile.model ]
    , lastTileId = 0
    }
