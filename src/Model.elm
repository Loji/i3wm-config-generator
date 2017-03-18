module Model exposing (..)

import TileContainer.Model as TileContainer


type alias Model =
    { tiles : List TileContainer.Model
    , lastTileId : Int
    }


initialModel : Model
initialModel =
    { tiles = [ TileContainer.model ]
    , lastTileId = 0
    }
