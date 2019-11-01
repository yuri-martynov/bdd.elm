module View exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import List
import Model exposing (..)
import Msg exposing (..)


view model =
    display model
        ++ buttons
        ++ digits
        |> div []


display model =
    [ div [] [ text (String.fromInt model) ] ]


buttons =
    []



-- [ btn Increment "+"
-- , btn Equals "="
-- , button [ onClick Decrement ] [ text "-" ]
-- ]


digit d =
    btn
        d
        (d |> String.fromInt)


digits =
    List.range 0 9
        |> List.map digit


btn msg label =
    button [ onClick msg ] [ text label ]
