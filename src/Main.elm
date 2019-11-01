module Main exposing (..)

import Browser
import Init exposing (..)
import Update exposing (..)
import View exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view }
