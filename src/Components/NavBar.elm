module Components.NavBar exposing (..)

import Html exposing (Attribute, Html, a, div, header, img, text)
import Html.Attributes exposing (class, href, id, src)


navbar : Html msg
navbar =
    header [ id "header" ]
        [ div [ class "nav-container" ]
            [ div [ class "nav-item-right-container" ]
                [ a [ class "nav-right-item", href "/about" ] [ text "About" ]
                , a [ class "nav-right-item", href "/projects" ] [ text "Projects." ]
                , a [ class "nav-right-item", href "/blog" ] [ text "Blog." ]
                , a [ class "nav-right-item", href "/resume" ] [ text "Resume." ]
                ]
            , img [ class "nav-right-item logo", src "./src/assets/images/logo.png" ] []
            ]
        ]
