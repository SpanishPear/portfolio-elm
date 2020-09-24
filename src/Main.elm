module Main exposing (..)

import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Nav exposing (Key)
import Element exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Util exposing (determinePage)
import Post.Title
import Route exposing (Route(..), routeParser)
import Url exposing (Url)
import Url.Parser as Parser


type alias Flags =
    {}


type Msg
    = ChangeUrl Url
    | ClickLink UrlRequest
    | NoOp


type alias Model =
    { navigationKey : Key
    , route : Maybe Route
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        _ =
            Debug.log "url" url

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
        let
            _ =
                Element.explain Debug.todo
        in
        List.singleton <| determinePage model.route
    }


onUrlRequest : UrlRequest -> Msg
onUrlRequest urlRequest =
    NoOp


onUrlChange : Url -> Msg
onUrlChange url =
    NoOp


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = ClickLink
        , onUrlChange = ChangeUrl
        }
