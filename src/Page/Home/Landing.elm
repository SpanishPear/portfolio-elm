module Page.Home.Landing exposing (view)

import Html exposing (Html, div, h1, h3)
import Html.Attributes exposing (class, id)


view : Html msg
view =
    div [ id "landing-container" ]
        [ div [ class "home-text-container" ]
            [ h1 [ id "landing-text-title" ]
                [ Html.text "Shrey Somaiya" ]
            , h3 [ class "landing-text-subtitle" ]
                [ Html.text "Computer Scientist" ]
            ]
        ]
