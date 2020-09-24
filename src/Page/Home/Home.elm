module Page.Home.Home exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Page.Home.About as About
import Page.Home.Landing as Landing


view : Html msg
view =
    div [] [ Landing.view, About.view ]
