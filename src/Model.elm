module Model exposing (..)

import TileContainer.Model as TileContainer


type alias Model =
    { tiles : TileContainer.Model
    }


initialModel : Model
initialModel =
    { tiles = TileContainer.model
    }
