module TileContainer.Model exposing (..)


type Layout
    = Horizontal
    | Vertical


type alias Model =
    { layout : Layout
    , tiles : ChildTiles
    , id : Int
    }


type ChildTiles
    = ChildTiles (List Model)


appendTile : ChildTiles -> Model -> ChildTiles
appendTile (ChildTiles list) element =
    ChildTiles (element :: list)


getChildList : ChildTiles -> List Model
getChildList (ChildTiles list) =
    list


model : Model
model =
    { layout = Horizontal
    , tiles = ChildTiles []
    , id = 0
    }
