module Quizzes.Messages exposing (..)

import Quizzes.Types exposing (QuizzId, Quizz)
import Time exposing (Time)


type Msg
    = FetchQuizzesDone (List Quizz)
    | FetchQuizzesFail
    | ShowQuizzes
    | ShowQuizz QuizzId
    | DoQuizz QuizzId
    | TestClickNext QuizzId
    | TestClickPrevious QuizzId
    | Tick Time
    | ConfirmingCancelTest
    | ConfirmedCancelTest Bool
