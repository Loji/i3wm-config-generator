module Model exposing (..)

import TileContainer.Model as TileContainer


type alias Model =
    { tiles : TileContainer.Model
    , test : String
    }


initialModel : Model
initialModel =
    { tiles = TileContainer.model
    , test = "asd"
    }
