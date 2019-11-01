module Model exposing (..)


type Model
    = Number Int
    | Add Model Model


display model =
    case model of
        Number n ->
            n

        Add (Number n) (Number 0) ->
            n

        Add old n ->
            display n
