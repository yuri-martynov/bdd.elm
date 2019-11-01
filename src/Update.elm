module Update exposing (update)

import Model exposing (..)
import Msg exposing (..)


update msg model =
    case ( msg, model ) of
        ( Digit d, Number n ) ->
            Number (n * 10 + d)

        ( Plus, _ ) ->
            Add model (Number 0)

        ( _, Add old n ) ->
            Add old (update msg n)
