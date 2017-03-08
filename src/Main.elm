module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import Update exposing (..)
import View exposing (..)


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
