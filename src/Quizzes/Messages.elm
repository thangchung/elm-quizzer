module Quizzes.Messages exposing (..)

import Quizzes.Types exposing (QuizzId, Quizz)


type Msg
    = FetchQuizzesDone (List Quizz)
    | FetchQuizzesFail
    | ShowQuizzes
    | ShowQuizz QuizzId
    | DoQuizz QuizzId
    | TestClickNext QuizzId
    | TestClickPrevious QuizzId
    | ConfirmingCancelTest
    | ConfirmedCancelTest Bool
