module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Msg.NoOp ->
            (model)
