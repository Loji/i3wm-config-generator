module View exposing (..)

import Html exposing (..)
import Model exposing (..)


view : Model -> Html msg
view model =
    div [] [ text "it's working" ]
