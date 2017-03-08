module TileContainer.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import TileContainer.Msg as TileContainer
import TileContainer.Model as TileContainer


view : TileContainer.Model -> Html Msg
view model =
    div
        [ onClick (Msg.MsgForTileContainer <| TileContainer.ChangeLayout) ]
        [ text "Toggle me hard, "
        , if model.layout == TileContainer.Horizontal then
            text "dev"
          else
            text "daddy"
        ]
