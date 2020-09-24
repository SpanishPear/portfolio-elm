module Page.Util exposing (..)

import Components.NavBar exposing (navbar)
import Element.Border as Border
import Html exposing (Attribute, Html, a, div, img, text)
import Html.Attributes exposing (class, href, src)
import Page.About
import Page.Home.Home
import Page.Home.Landing
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
            Page.About.view

        Just Resume ->
            Page.Resume.view

        Just (Post postTitle) ->
            Page.Post.view postTitle

        Just NotFound ->
            Page.NotFound.view

        Nothing ->
            Page.NotFound.view
