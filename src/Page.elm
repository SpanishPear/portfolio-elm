module Page exposing (..)

import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Element.Region exposing (heading)


{-| Determines which navbar link (if any) will be rendered as active.

Note that we don't enumerate every page here, because the navbar doesn't
have links for every page. Anything that's not part of the navbar falls
under Other.

-}
type Page
    = Other
    | Home
    | About
    | Resume
    | Blog


header : Element msg
header =
    row [ padding 30, width fill ]
        [ row [ centerX, spacing 100 ]
            [ link [ Font.bold, Font.size 30, alignLeft ] { url = "/", label = text "Shrey's Teaching Site" }
            ]
        ]
