module Subscriptions exposing (subscriptions)

import Messages exposing (Msg(..))
import Quizzes.Messages
import Models exposing (..)
import Ports exposing (confirmedCancelTest)
import Time exposing (Time, second)


{-| Subscribe to the quizz test cancel confirmations and time in every second.
-}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ confirmedCancelTest Quizzes.Messages.ConfirmedCancelTest
            |> Sub.map QuizzesMsg
        , Time.every second Quizzes.Messages.Tick
            |> Sub.map QuizzesMsg
        ]
