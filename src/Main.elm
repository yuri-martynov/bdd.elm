module Main exposing (..)

import Browser
import Update exposing (..)
import View exposing (..)
import Init exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view }




