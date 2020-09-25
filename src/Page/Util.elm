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


determinePage : Maybe Route -> Html msg
determinePage route =
    case route of
        Just Home ->
            div [] [ navbar, Page.Home.Home.view ]

        Just Root ->
            Page.Root.view

        Just About ->
            div [] [ navbar, Page.About.view ]

        Just Resume ->
            Page.Resume.view

        Just (Post postTitle) ->
            Page.Post.view postTitle

        Just NotFound ->
            Page.NotFound.view

        Nothing ->
            Page.NotFound.view
