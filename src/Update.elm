module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Tile.Update as Tile
import Tile.Model as TileModel
import Controls.Update as Controls


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
                                    TileModel.appendTile m.tiles (TileModel.newTile model.lastTileId)
                            }
                        )
                        idTile
                        model.tiles
                , lastTileId = model.lastTileId + 1
            }

        Msg.ModifyControls msg ->
            { model
                | controls = Controls.update msg model.controls
            }
