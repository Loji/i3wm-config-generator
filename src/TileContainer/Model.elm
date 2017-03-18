module TileContainer.Model exposing (..)


type Layout
    = Horizontal
    | Vertical


type alias Model =
    { layout : Layout
    , tiles : ChildTiles
    , id : Int
    }


type alias ModelOperation =
    Model -> Model


type ChildTiles
    = ChildTiles (List Model)


appendTile : ChildTiles -> Model -> ChildTiles
appendTile (ChildTiles list) element =
    ChildTiles (element :: list)


getChildList : ChildTiles -> List Model
getChildList (ChildTiles list) =
    list


modifyById : ModelOperation -> Int -> ChildTiles -> ChildTiles
modifyById fun id childList =
    ChildTiles
        (List.map
            (\el ->
                if el.id == id then
                    fun el
                else if List.length el.tiles == 0 then
                    el
                else
                    { el
                        | tiles = modifyById fun id el.tiles
                    }
            )
            (getChildList childList)
        )


model : Model
model =
    { layout = Horizontal
    , tiles = ChildTiles []
    , id = 0
    }
