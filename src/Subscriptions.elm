module Subscriptions exposing (subscriptions)

import Messages exposing (Msg(..))
import Quizzes.Messages
import Models exposing (..)
import Ports exposing (confirmedCancelTest)


{-| Subscribe to the quizz test cancel confirmations.
-}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ confirmedCancelTest Quizzes.Messages.ConfirmedCancelTest
            |> Sub.map QuizzesMsg
        ]
