module Page.Controller exposing (determinePage)

import Components.NavBar exposing (navbar)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
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
            div [class "main-viewport"] [ navbar, Page.Home.Home.view ]

        Just Root ->
            div [class "main-viewport"] [ navbar, Page.Construction.view ]
        Just About ->
            div [class "main-viewport"] [ navbar, Page.About.view ]

        Just Resume ->
            div [class "main-viewport"] [ navbar, Page.Construction.view ]

        Just (Post postTitle) ->
            div [class "main-viewport"] [ navbar, Page.Post.view postTitle ]

        Just NotFound ->
            div [class "main-viewport"] [ navbar, Page.Construction.view ]
        Nothing ->
            div [class "main-viewport"] [ navbar, Page.Construction.view ]

