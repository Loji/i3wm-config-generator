module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import Update exposing (..)
import View exposing (..)
import Msg exposing (..)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = Model
        , view = view
        , update = update
        }
