module Main exposing (..)

import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav exposing (Key)
import Element exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Controller exposing (determinePage)
import Post.Title
import Route exposing (Route(..), routeParser)
import Url exposing (Url)
import Task exposing (Task)
import Url.Parser as Parser
import SmoothScroll exposing (scrollTo)
import Msg exposing (Msg(..))
import Page.Util exposing (jumpToBottomOfId, resetViewport)

type alias Flags =
    {}




type alias Model =
    { navigationKey : Key
    , route : Maybe Route
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    let
        parsedUrl =
            Parser.parse routeParser url

        model =
            { navigationKey = key, route = parsedUrl }
    in
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ChangeUrl url ->
            ( { model | route = Parser.parse routeParser url }, Cmd.none )

        ClickLink urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model, Nav.pushUrl model.navigationKey <| Url.toString url )

                External url ->
                    ( model, Nav.load url )

        ResetScroll ->
            (model, resetViewport)
        
        ScrollTo id->

            (model, jumpToBottomOfId id)



view : Model -> Document Msg
view model =
    let
        title =
            case model.route of
                Just route ->
                    case route of
                        Home ->
                            "SpanishPear"

                        Root ->
                            "Secret Page!"

                        About ->
                            "About"

                        Resume ->
                            "Resume"

                        Post postTitle ->
                            Post.Title.toString postTitle

                        NotFound ->
                            "404"

                Nothing ->
                    "NULL"
    in
    { title = title
    , body =
        List.singleton <| determinePage model.route
    }


onUrlRequest : UrlRequest -> Msg
onUrlRequest _ =
    NoOp


onUrlChange : Url -> Msg
onUrlChange _ =
    NoOp


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = ClickLink
        , onUrlChange = ChangeUrl
        }
