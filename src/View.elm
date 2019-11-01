module View exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import List
import Model exposing (display)
import Msg exposing (..)


view model =
    screen (display model)
        ++ buttons
        ++ digits
        |> div []


screen model =
    [ div [] [ text (String.fromInt model) ] ]


buttons =
    [ btn Plus "+"
    ]


digit d =
    btn
        (Digit d)
        (d |> String.fromInt)


digits =
    List.range 0 9
        |> List.map digit


btn msg label =
    button [ onClick msg ] [ text label ]
