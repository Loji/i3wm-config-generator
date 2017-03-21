module Model exposing (..)

import TileContainer.Model as TileContainer


type alias Model =
    { tiles : TileContainer.ChildTiles
    , lastTileId : Int
    }


initialModel : Model
initialModel =
    { tiles = TileContainer.ChildTiles [ TileContainer.model ]
    , lastTileId = 0
    }
