module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Tile.Update as Tile
import Tile.Model as TileModel


update : Msg -> Model -> Model
update mainMsg model =
    case mainMsg of
        Msg.ModifyTile msg idTile ->
            { model
                | tiles =
                    TileModel.modifyById
                        (\m -> Tile.update mainMsg m)
                        idTile
                        model.tiles
            }

        Msg.AddTile idTile ->
            { model
                | tiles =
                    TileModel.modifyById
                        (\m ->
                            { m
                                | tiles =
                                    TileModel.appendTile m.tiles
                                        { layout = TileModel.Horizontal
                                        , tiles = TileModel.ChildTiles []
                                        , id = model.lastTileId
                                        }
                            }
                        )
                        idTile
                        model.tiles
                , lastTileId = model.lastTileId + 1
            }
