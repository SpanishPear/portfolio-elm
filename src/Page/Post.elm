module Page.Post exposing (view)

import Html exposing (Html, h2)
import Post.Title as Title exposing (Title)


view : Title -> Html msg
view title =
    h2 [] [ Html.text <| Title.toString title ]
