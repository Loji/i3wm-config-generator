module Tile.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Msg exposing (Msg)
import Tile.Msg as Tile
import Tile.Model as Tile


view : Tile.Model -> Html Msg
view model =
    if model.visible then
        let
            tileLayout =
                if model.layout == Tile.Horizontal then
                    "tile-containter--horizontal"
                else
                    "tile-containter--vertical"

            toggleLayoutIcon =
                if model.layout == Tile.Horizontal then
                    "fa-arrows-v"
                else
                    "fa-arrows-h"

            isTile =
                List.length (Tile.getChildTiles model.tiles) == 0

            hasChildrenClass =
                if isTile then
                    "tile--single"
                else
                    "tile--hasChildren"

            tileContent =
                if isTile then
                    [ div [ class "tile-contentWrapper" ]
                        [ div [ class "tile-content" ]
                            [ div [ class "tile-title" ] [ text "Title" ]
                            , img [ src ("https://unsplash.it/1920/1080/?image=" ++ (toString (model.id % 10))) ] []
                            ]
                        ]
                    ]
                else
                    [ div
                        [ class "tile-contentWrapper" ]
                        [ div
                            [ class ("tile-container " ++ tileLayout) ]
                            (List.map view (Tile.getChildTiles model.tiles))
                        ]
                    ]
        in
            div
                [ class
                    ("tile " ++ hasChildrenClass)
                ]
                (List.append
                    [ div [ class "tile-actionButtons" ]
                        [ if isTile then
                            text ""
                          else
                            i
                                [ onClick (Msg.ModifyTile Tile.ChangeLayout model.id)
                                , class ("fa " ++ toggleLayoutIcon)
                                ]
                                []
                        , i
                            [ onClick (Msg.AddTile model.id)
                            , class ("fa fa-plus")
                            ]
                            []
                        , i
                            [ onClick (Msg.ModifyTile Tile.HideTile model.id)
                            , class ("fa fa-trash-o")
                            ]
                            []
                        ]
                    ]
                    tileContent
                )
    else
        text ""
