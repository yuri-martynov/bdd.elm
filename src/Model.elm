module Model exposing (..)


type Model
    = Number Int
    | Add Model Model
    | None


create n =
    Number n


display model =
    case model of

        Add a None -> 
            result a

        Add _ b ->
            result b

        _ ->
            result model


result model =
    case model of
        None ->
            0

        Number n ->
            n

        Add a b ->
            result a + result b


history model =
    -- Debug.toString model
    case model of
        None -> ""
        Number n-> String.fromInt n
        Add a b -> history a ++ " + " ++ history b
