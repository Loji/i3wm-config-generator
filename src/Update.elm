module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import TileContainer.Update as TileContainer
import TileContainer.Model as TileContainerModel


update : Msg -> Model -> Model
update mainMsg model =
    case mainMsg of
        Msg.ModifyTileContainer msg idTileContainer ->
            -- let
            --     msgForTileContainer index tile =
            --         if (index == idTileContainer) then
            --             TileContainer.update mainMsg tile
            --         else
            --             tile
            -- in
            --     { model
            --         | tiles = List.indexedMap msgForTileContainer (TileContainerModel.getChildTiles model.tiles)
            --     }
            model

        Msg.AddTileContainer idParent ->
            { model
                | tiles =
                    TileContainerModel.modifyById
                        (\m ->
                            { m
                                | tiles =
                                    TileContainerModel.appendTile m.tiles
                                        { layout = TileContainerModel.Horizontal
                                        , tiles = TileContainerModel.ChildTiles []
                                        , id = model.lastTileId
                                        }
                            }
                        )
                        idParent
                        model.tiles
                , lastTileId = model.lastTileId + 1
            }
