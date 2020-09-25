module Page.Home.Home exposing (view)

import Html exposing (Html, div)
import Page.Home.About as About
import Page.Home.Landing as Landing


view : Html msg
view =
    div [] [ Landing.view, About.view ]
