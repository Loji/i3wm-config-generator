module Controls.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Controls.Model as Controls
import Msg exposing (Msg)
import Controls.Msg as Controls


view : Controls.Model -> Html Msg
view model =
    let
        controlsClass =
            if model.editing then
                "active"
            else
                ""
    in
        div [ class "controlBar" ]
            [ i
                [ class ("fa fa-cog " ++ controlsClass)
                , onClick (Msg.ModifyControls Controls.ToggleSettings)
                ]
                []
            ]
