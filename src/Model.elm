module Model exposing (..)


type Model
    = Number Int
    | Operation Operations Model Model
    | None

type Operations
    = Add
    | Sub


create n =
    Number n


display model =
    case model of

        Operation _ a None -> 
            result a

        Operation _ _ b ->
            result b

        _ ->
            result model


result model =
    case model of
        None ->
            0

        Number n ->
            n

        Operation op a b ->
            case op of
               Add -> result a + result b
               Sub -> result a - result b


history model =
    -- Debug.toString model
    case model of
        None -> ""
        Number n-> String.fromInt n
        Operation op a b -> history a ++ (opstr op) ++ history b


opstr op =
    case op of
       Add -> "+"
       Sub -> "-"