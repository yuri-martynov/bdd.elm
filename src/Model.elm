module Model exposing (Model(..), Operations(..), display, history, none, number, result)


type Model
    = Number Float
    | Operation Operations Model Model
    | None


type Operations
    = Add
    | Sub
    | Multiply
    | Divide


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
            opFunc op (result a) (result b)


history model =
    -- Debug.toString model
    case model of
        None ->
            ""

        Number n ->
            String.fromFloat n

        Operation op a b ->
            history a ++ opStr op ++ history b


none =
    None


number n =
    Number n


opStr op =
    case op of
        Add ->
            "+"

        Sub ->
            "-"

        Multiply ->
            "x"

        Divide ->
            "/"


opFunc op =
    case op of
        Add ->
            (+)

        Sub ->
            (-)

        Multiply ->
            (*)

        Divide ->
            (/)
