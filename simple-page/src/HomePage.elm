module HomePage exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Welcome to Tchotchoza Page" ]
        , p []
            [ text "Dunder TchotchoTec Inc. (stock symbol "
            , strong [] [ text "DTC" ]
            , text <| 
                """
                 ) is a fictional company used as an example to illustrate the use of 
                """
            ]
        ]

main =
    view "dummy model"