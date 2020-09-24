module Page.Home.About exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "about-container" ] [ Html.text "ABOUT" ]
