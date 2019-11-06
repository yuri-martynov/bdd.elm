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
            Number d

        ( Digit d, Number n ) ->
            Number (n * 10 + d)

        ( _, Operation op a b ) ->
            Operation op a (update msg b)




-- case model of
--     None ->
--         case msg of
--             Digit d ->
--                 Number d
--             _ ->
--                 model
--     Number n ->
--         case msg of
--             Digit d ->
--                 Number (n * 10 + d)
--             Plus ->
--                 Operation model None
--             _ ->
--                 model
--     Operation a b ->
--         case msg of
--             Equal ->
--                 model |> result |> Number
--             Plus ->
--                 Operation model None
--             _ ->
--                 Operation a (update msg b)
