module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Tile.Update as Tile
import Tile.Model as TileModel


update : Msg -> Model -> Model
update mainMsg model =
    case mainMsg of
        Msg.ModifyTile msg idTile ->
            let
                msgForTile index tile =
                    if (index == idTile) then
                        Tile.update mainMsg tile
                    else
                        tile
            in
                { model
                    | tiles = TileModel.ChildTiles (List.indexedMap msgForTile (TileModel.getChildTiles model.tiles))
                }

        Msg.AddTile idParent ->
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
                        idParent
                        model.tiles
                , lastTileId = model.lastTileId + 1
            }
