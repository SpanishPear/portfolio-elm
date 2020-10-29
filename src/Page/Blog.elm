module Page.Blog exposing (view)

import Html exposing (Html, h2, div)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [class "viewport-container"] [
        h2 [] [Html.text "test"]
    ]
