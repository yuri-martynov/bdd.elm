module Tests exposing (..)

import Expect exposing (..)
import Init exposing (..)
import Model exposing (create, display)
import Msg exposing (..)
import Test exposing (..)
import Update exposing (..)


suite =
    describe "calculator"
        [ test "Starts with 0" <|
            \_ ->
                -- a |> b = b a
                -- sin 90 = 90 |> sin
                -- abs (sin 90) = 90 |> sin |> abs
                
                -- equal 0 (display init) 
                init 
                    |> display 
                    |> equal 0

        , test "When 8 is clicked displays 8" <|
            \_ ->
                -- equal 8 (display (update 8 init))
                init
                    |> update (Digit 8)
                    |> display
                    |> equal 8

        , test "When 1 is clicked displays 1" <|
            \_ ->
                init
                    |> update (Digit 1)
                    |> display
                    |> equal 1
        , test "When 1 and 2 are clicked displays 12" <|
            \_ ->
                init
                    |> update (Digit 1)
                    |> update (Digit 2)
                    |> display
                    |> equal 12
        , test "Given 12 entered when + is clicked displays 12" <|
            \_ ->
                12
                    |> create
                    |> update Plus
                    |> display
                    |> equal 12
        , test "Given 13 entered when + is clicked displays 13" <|
            \_ ->
                13
                    |> create
                    |> update Plus
                    |> display
                    |> equal 13
        , test "Given 13 entered when + is clicked and 3 is clicked displays 3" <|
            \_ ->
                13
                    |> create
                    |> update Plus
                    |> update (Digit 3)
                    |> display
                    |> equal 3
        ]
