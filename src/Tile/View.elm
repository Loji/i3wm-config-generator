module Tile.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Msg exposing (Msg)
import Tile.Msg as Tile
import Tile.Model as Tile


view : Tile.Model -> Html Msg
view model =
    let
        tileLayout =
            if model.layout == Tile.Horizontal then
                "tileContainter--horizontal"
            else
                "tileContainter--vertical"

        toggleLayoutIcon =
            if model.layout == Tile.Horizontal then
                "fa-arrows-v"
            else
                "fa-arrows-h"

        tileType =
            if List.length (Tile.getChildTiles model.tiles) == 0 then
                "tile"
            else
                "tileContainter"

        tileContent =
            if List.length (Tile.getChildTiles model.tiles) == 0 then
                [ div [ class "tileTitle" ] [ text "Title" ] ]
            else
                (List.map view (Tile.getChildTiles model.tiles))
    in
        div
            [ class
                (tileType ++ " " ++ tileLayout)
            ]
            (List.append
                [ div [ class "tileActionButtons" ]
                    [ i
                        [ onClick (Msg.ModifyTile Tile.ChangeLayout model.id)
                        , class ("fa " ++ toggleLayoutIcon)
                        ]
                        []
                    , i
                        [ onClick (Msg.AddTile model.id)
                        , class ("fa fa-plus")
                        ]
                        []
                    ]
                ]
                tileContent
            )
