module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List
import Model exposing (Operations(..), display, history)
import Msg exposing (..)


view model =
    css
        :: screen model
        :: buttons
        ++ digits
        |> div [ class "calc-body" ]
        |> List.singleton
        |> div [ class "container" ]


screen model =
    [ operation model
    , typed model
    ]
        |> div [ class "calc-screen" ]


typed model =
    [ model |> display |> String.fromFloat |> text
    , "_" |> text |> List.singleton |> span [ class "blink-me" ]
    ]
        |> div [ class "calc-typed" ]


operation model =
    model
        |> history
        |> text
        |> List.singleton
        |> div [ class "calc-operation" ]


buttons =
    [ btn (OperationMsg Add) "+"
    , btn (OperationMsg Sub) "-"
    , btn (OperationMsg Multiply) "x"
    , btn (OperationMsg Divide) "/"
    , btn Equal "="
    ]


digits =
    List.range 0 9
        |> List.map digit


digit d =
    btn
        (Digit d)
        (d |> String.fromInt)


btn msg label =
    button
        [ onClick msg, class "button" ]
        [ text label ]


css =
    node "link" [ rel "stylesheet", href "style.css" ] []
