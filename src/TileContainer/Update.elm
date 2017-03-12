module TileContainer.Update exposing (..)

import TileContainer.Msg as TileContainer
import TileContainer.Model as TileContainer
import Msg as Main


update : Main.Msg -> TileContainer.Model -> TileContainer.Model
update msg model =
    case msg of
        Main.MsgForTileContainer msg id ->
            updateTileContainer msg model


updateTileContainer : TileContainer.Msg -> TileContainer.Model -> TileContainer.Model
updateTileContainer msg model =
    case msg of
        TileContainer.ChangeLayout ->
            { model
                | layout =
                    if model.layout == TileContainer.Horizontal then
                        TileContainer.Vertical
                    else
                        TileContainer.Horizontal
            }

        TileContainer.AddTile ->
            { model | tiles = TileContainer.appendTile model.tiles TileContainer.model }
