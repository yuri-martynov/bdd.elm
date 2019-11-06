module Update exposing (update)

import Model exposing (Model(..), result)
import Msg exposing (..)


update msg model =
    case model of
        None ->
            case msg of
                Digit d ->
                    Number d

                _ ->
                    model

        Number n ->
            case msg of
                Digit d ->
                    Number (n * 10 + d)

                Plus ->
                    Add model None

                _ ->
                    model

        Add a b ->
            case msg of
                Equal ->
                    model |> result |> Number

                Plus ->
                    Add model None

                _ ->
                    Add a (update msg b)
