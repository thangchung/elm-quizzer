port module Ports exposing (confirmingCancelTest, confirmedCancelTest)

{-| This Ports contains all the functions that communicates with outside Elm Application. The functions as below
+ confirmingCancelTest
+ confirmedCancelTest

@docs Ports

-}


port confirmingCancelTest : String -> Cmd msg


port confirmedCancelTest : (Bool -> msg) -> Sub msg
