module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import TileContainer.Update as TileContainer


update : Msg -> Model -> Model
update mainMsg model =
    case mainMsg of
        Msg.ModifyTileContainer msg idTileContainer ->
            let
                msgForTileContainer index tile =
                    if (index == idTileContainer) then
                        TileContainer.update mainMsg tile
                    else
                        tile
            in
                { model
                    | tiles = List.indexedMap msgForTileContainer model.tiles
                }

        Msg.AddTileContainer idParent ->
            model
