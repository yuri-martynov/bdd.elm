module Model exposing (..)


type Model
    = Number Int
    | Add Model Model

create n = Number n

display model =
    case model of
        Number n ->
            n

        Add (Number n) (Number 0) ->
            n

        Add _ b ->
            display b
