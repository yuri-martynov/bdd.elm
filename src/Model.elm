module Model exposing (..)


type Model
    = Number Int
    | Add Model Model
    | None

create n = Number n

display model =
    case model of
        Number n ->
            n

        None ->
            0

        Add a None ->
            display a 

        Add _ b ->
            display b

