module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)
import TileContainer.View as TileContainer


view : Model -> Html Msg
view model =
    let
        tiles =
            model.tiles
    in
        div [ class "mainTileContainer" ]
            (List.map TileContainer.view tiles)
