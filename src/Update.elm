module Update exposing (update)

import Model exposing (Model(..), result)
import Msg exposing (..)


update msg model =
    case ( msg, model ) of
        ( Equal, _ ) ->
            model |> result |> Number

        ( OperationMsg op, _ ) ->
            Operation op model None

        ( Digit d, None ) ->
            Number (toFloat d)

        ( Digit d, Number n ) ->
            Number (n * 10 + toFloat d)

        ( _, Operation op a b ) ->
            Operation op a (update msg b)



