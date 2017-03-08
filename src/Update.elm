module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import TileContainer.Update as TileContainer


update : Msg -> Model -> Model
update mainMsg model =
    case mainMsg of
        Msg.MsgForTileContainer msg ->
            { model | tiles = TileContainer.update mainMsg model.tiles }
