module Page.Construction exposing (..)
import Html exposing (Html, img, div)
import Html.Attributes exposing (class, src)

view : Html msg
view =
    div [ class "construction-image-container" ] [ img [  src "./src/assets/images/under-construction.png" ] [] ]
