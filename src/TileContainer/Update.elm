module TileContainer.Update exposing (..)

import TileContainer.Msg as TileContainer
import TileContainer.Model as TileContainer
import Msg as Main


update : Main.Msg -> TileContainer.Model -> TileContainer.Model
update msg model =
    case msg of
        Main.MsgForTileContainer msg ->
            updateTileContainer msg model


updateTileContainer : TileContainer.Msg -> TileContainer.Model -> TileContainer.Model
updateTileContainer msg model =
    case msg of
        TileContainer.ChangeLayout ->
            { model | layout = TileContainer.Horizontal }
