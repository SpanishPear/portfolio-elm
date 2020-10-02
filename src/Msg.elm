module Msg exposing (Msg(..))
import Browser exposing ( UrlRequest(..))
import Url exposing (Url)

type Msg
    = ChangeUrl Url
    | ClickLink UrlRequest
    | ScrollTo String
    | ResetScroll
    | NoOp