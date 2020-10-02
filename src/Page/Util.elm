module Page.Util exposing (determinePage)

import Components.NavBar exposing (navbar)
import Html exposing (Html, div)
import Page.About
import Page.Home.Home
import Page.NotFound
import Page.Post
import Page.Resume
import Page.Root
import Route exposing (Route(..))
import Url.Builder exposing (Root)
import Page.Construction


determinePage : Maybe Route -> Html msg
determinePage route =
    case route of
        Just Home ->
            div [] [ navbar, Page.Home.Home.view ]

        Just Root ->
            div [] [ navbar, Page.Construction.view ]
        Just About ->
            div [] [ navbar, Page.About.view ]

        Just Resume ->
            div [] [ navbar, Page.Construction.view ]

        Just (Post postTitle) ->
            Page.Post.view postTitle

        Just NotFound ->
            div [] [ navbar, Page.Construction.view ]
        Nothing ->
            div [] [ navbar, Page.Construction.view ]