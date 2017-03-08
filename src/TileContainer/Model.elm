module TileContainer.Model exposing (..)


type Layout
    = Horizontal
    | Vertical


type alias Model =
    { layout : Layout
    , tiles : List String
    }


model : Model
model =
    { layout = Horizontal
    , tiles = []
    }
