module Msg exposing (..)

import Model exposing (Operations)


type Msg
    = Digit Int
    | OperationMsg Operations 
    | Equal
