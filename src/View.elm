module View exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import List
import Msg exposing (..)


view model =
    display model
        ++ buttons
        ++ digits
        |> div []


display model =
    [ div [] [ text (String.fromInt model) ] ]


buttons = []
    -- [ btn Increment "+" 
    -- , btn Equals "="
    -- , button [ onClick Decrement ] [ text "-" ]
    -- ]


digit d =
    btn
        (d |> Digit )
        (d |> String.fromInt)

btn msg label = button [onClick msg] [text label] 



digits =
    List.range 0 9
        |> List.map digit
