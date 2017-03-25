module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Tile.View as Tile
import Tile.Model exposing (getChildTiles)
import Controls.View as Controls


view : Model -> Html Msg
view model =
    let
        tiles =
            model.tiles

        controls =
            model.controls

        mainClass =
            if controls.editing then
                "editMode"
            else
                ""
    in
        div [ class "flex" ]
            [ div [ class ("mainView flex--column " ++ mainClass) ]
                [ div
                    [ class "workspaces-bar"
                    ]
                    [ div [ class "workspace-icon" ] [ text "1" ]
                    ]
                , div [ class "workspace" ]
                    (List.map Tile.view (getChildTiles tiles))
                ]
            , Controls.view controls
            ]
