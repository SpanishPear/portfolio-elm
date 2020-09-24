module Post.Title exposing (Title, decoder, toString, urlParser)

import Json.Decode as Decode exposing (Decoder)
import Url.Parser exposing (Parser)



-- TYPES


type Title
    = Title String



-- CREATE


urlParser : Parser (Title -> a) a
urlParser =
    Url.Parser.custom "Title" (\str -> Just (Title str))


decoder : Decoder Title
decoder =
    Decode.map Title Decode.string



-- TRANSFORM


toString : Title -> String
toString (Title str) =
    str
