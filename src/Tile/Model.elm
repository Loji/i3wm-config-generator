module Tile.Model exposing (..)


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


newTile : Int -> Model
newTile id =
    { model
        | id = id
    }


addChildTile : Model -> Model
addChildTile modifiedModel =
    { modifiedModel
        | tiles = appendTile modifiedModel.tiles model
    }


appendTile : ChildTiles -> Model -> ChildTiles
appendTile (ChildTiles list) element =
    ChildTiles (element :: list)


getChildTiles : ChildTiles -> List Model
getChildTiles (ChildTiles list) =
    list


modifyById : ModelOperation -> Int -> ChildTiles -> ChildTiles
modifyById fun id modifiedModel =
    ChildTiles
        (List.map
            (\el ->
                if el.id == id then
                    fun el
                else
                    { el | tiles = modifyById fun id el.tiles }
            )
            (getChildTiles modifiedModel)
        )


model : Model
model =
    { layout = Horizontal
    , tiles = ChildTiles []
    , id = 0
    }
