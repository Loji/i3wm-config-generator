module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Tile.View as Tile
import Tile.Model exposing (getChildTiles)


view : Model -> Html Msg
view model =
    let
        tiles =
            model.tiles
    in
        div [ class "mainTile editMode" ]
            (List.map Tile.view (getChildTiles tiles))
