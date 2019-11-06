module Update exposing (update)

import Model exposing (..)
import Msg exposing (..)


update msg model =
    case ( msg, model ) of
        ( Digit d, Number n ) ->
            Number (n * 10 + d)

        ( Digit d, None ) ->
            Number d

        ( Plus, _ ) ->
            Add model None

        ( Equal, Add (Number a) (Number b) ) ->
             Number (a + b)

        ( _, Add old n ) ->
            Add old (update msg n)

        _ -> model


