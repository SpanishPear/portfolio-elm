module Components.NavBar exposing (navbar)

import Html exposing (Html, a, div, header, img, text)
import Html.Attributes exposing (class, href, id, src, target)


navbar : Html msg
navbar =
    header [ id "header" ]
        [ div [ class "nav-container" ]
            [ div [ class "nav-item-right-container" ]
                [ a [ class "nav-right-item", href "#about", target "_self" ] [ text "About" ]
                , a [ class "nav-right-item", href "/projects" ] [ text "Projects." ]
                , a [ class "nav-right-item", href "/blog" ] [ text "Blog." ]
                , a [ class "nav-right-item", href "/resume" ] [ text "Resume." ]
                ]
            , a [{- TODO scroll to top https://package.elm-lang.org/packages/linuss/smooth-scroll/latest/ -}] [ img [ class "nav-right-item logo", src "./src/assets/images/logo.png" ] [] ]
            ]
        ]
