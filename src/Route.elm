module Route exposing (..)

import Post.Title as Title exposing (Title)
import Url.Parser as Parser exposing ((</>), oneOf, s, top)


type Route
    = Home
    | Root
    | About
    | Resume
    | Post Title
    | NotFound


routeParser : Parser.Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Root (s "root")
        , Parser.map About (s "about")
        , Parser.map Resume (s "resume")
        , Parser.map Post (s "post" </> Title.urlParser)
        ]
