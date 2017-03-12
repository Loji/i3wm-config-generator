module TileContainer.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Msg exposing (Msg)
import TileContainer.Msg as TileContainer
import TileContainer.Model as TileContainer


view : TileContainer.Model -> Html Msg
view model =
    let
        tileContainerLayout =
            if model.layout == TileContainer.Horizontal then
                "tileContainter--horizontal"
            else
                "tileContainter--vertical"

        toggleLayoutIcon =
            if model.layout == TileContainer.Horizontal then
                "fa-arrows-v"
            else
                "fa-arrows-h"
    in
        div
            [ class
                ("tileContainter " ++ tileContainerLayout)
            ]
            (List.append
                [ div [ class "tileActionButtons" ]
                    [ i
                        [ onClick (Msg.MsgForTileContainer TileContainer.ChangeLayout model.id)
                        , class ("fa " ++ toggleLayoutIcon)
                        ]
                        []
                    , i
                        [ onClick (Msg.MsgForTileContainer TileContainer.AddTile model.id)
                        , class ("fa fa-plus")
                        ]
                        []
                    ]
                , text "Here lies list"
                ]
                (List.map view (TileContainer.getChildList model.tiles))
            )
