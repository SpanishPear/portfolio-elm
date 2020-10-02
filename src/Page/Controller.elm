module Page.Controller exposing (determinePage)

import Components.TopPin exposing (topPin)
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
import Msg exposing (Msg(..))
import Task exposing (Task)
import Browser.Dom as Dom

determinePage : Maybe Route -> Html Msg
determinePage route =
    case route of
        Just Home ->
            div [] [ topPin, navbar, Page.Home.Home.view ]

        Just Root ->
            div [] [ navbar, Page.Construction.view ]
        Just About ->
            div [] [ navbar, Page.About.view ]

        Just Resume ->
            div [] [ navbar, Page.Construction.view ]

        Just (Post postTitle) ->
            div [] [ navbar, Page.Post.view postTitle ]

        Just NotFound ->
            div [] [ navbar, Page.Construction.view ]
        Nothing ->
            div [] [ navbar, Page.Construction.view ]

