module Page.Post exposing (..)

import Html exposing (..)
import Post.Title as Title exposing (Title)


view : Title -> Html msg
view title =
    h2 [] [ Html.text <| Title.toString title ]
