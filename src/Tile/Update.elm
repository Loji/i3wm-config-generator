module Tile.Update exposing (..)

import Tile.Msg as Tile
import Tile.Model as Tile
import Msg as Main


update : Main.Msg -> Tile.Model -> Tile.Model
update msg model =
    case msg of
        Main.ModifyTile msg id ->
            updateTile msg model

        _ ->
            model


updateTile : Tile.Msg -> Tile.Model -> Tile.Model
updateTile msg model =
    case msg of
        Tile.ChangeLayout ->
            { model
                | layout =
                    if model.layout == Tile.Horizontal then
                        Tile.Vertical
                    else
                        Tile.Horizontal
            }

        Tile.HideTile ->
            { model
                | visible = False
            }

        Tile.AddChildren child ->
            { model
                | tiles = Tile.appendTile model.tiles child
            }
