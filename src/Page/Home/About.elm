module Page.Home.About exposing (..)

import Html exposing (Html, div, h1, img, p)
import Html.Attributes exposing (class, src)


view : Html msg
view =
    div [ class "about-container" ]
        [ div [ class "about-content-container" ]
            [ img [ class "about-headshot", src "./src/assets/images/headshot.png" ] []
            , div [ class "about-heading-container" ]
                [ h1 [ class "about-heading-text" ] [ Html.text "Shrey Somaiya" ]
                , div [ class "about-heading-right-border" ] []
                ]
            , p [ class "about-content-text" ]
                [ Html.text aboutContent ]
            ]
        ]


aboutContent : String
aboutContent =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
