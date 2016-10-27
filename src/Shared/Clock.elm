module Shared.Clock exposing (clock)

import Html.Attributes as HA exposing (style)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Date as D exposing (..)


{-| LEADING ZERO
-}
leadingZero : Int -> String
leadingZero t =
    if t < 10 then
        "0" ++ (toString t)
    else
        toString t


{-| RETURN CURRENT TIME FORMATTED
-}
currentTime : Float -> String
currentTime t =
    let
        date' =
            fromTime t

        hour' =
            leadingZero (D.hour date')

        minute' =
            leadingZero (D.minute date')

        second' =
            leadingZero (D.second date')

        now =
            hour' ++ ":" ++ minute' ++ ":" ++ second'
    in
        now


{-| GENERATE `<text>` WITH STYLES
-}
prettifyText : String -> Svg msg
prettifyText string =
    text'
        [ HA.style
            [ ( "fill", "rgb(221, 250, 219)" )
            , ( "fontSize", "40px" )
            , ( "fontFamily", "Orbitron" )
            ]
        , x "100"
        , y "65"
        , textAnchor "middle"
        ]
        [ text string ]


{-| RECT STYLE
-}
rectStyle =
    [ width "200"
    , height "100"
    , fill "rgb(27, 188, 155)"
    , stroke "rgb(27, 163, 156)"
    , strokeWidth "10"
    ]


{-| GENERATE THE CLOCK
-}
clock t =
    svg
        [ width "200", height "100", viewBox "0 0 200 100" ]
        [ rect rectStyle []
        , prettifyText (currentTime t)
        ]
