module View exposing (..)

import Html exposing (..)
import Model exposing (..)
import Msg exposing (..)
import TileContainer.View as TileContainer


view : Model -> Html Msg
view model =
    let
        tiles =
            model.tiles
    in
        div []
            [ text "it's working"
            , TileContainer.view tiles
            ]
