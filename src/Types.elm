module Types exposing (Msg(..), Content)
import Browser exposing ( UrlRequest(..))
import Url exposing (Url)

type Msg
    = ChangeUrl Url
    | ClickLink UrlRequest
    | ScrollTo String
    | ResetScroll
    | NoOp

type alias Content =
    { title : String
    , name : String
    , slug : String
    , markdown : String
    , intro : String
    }
