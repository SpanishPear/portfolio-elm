module Page.Home.Landing exposing (..)

import Html exposing (Html, div, h1, h3)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "landing-container" ]
        [ div [ class "home-text-container" ]
            [ h1 [ class "landing-text-title" ]
                [ Html.text "Shrey Somaiya" ]
            , h3 [ class "landing-text-subtitle" ]
                [ Html.text "Computer Scientist" ]
            ]
        ]
