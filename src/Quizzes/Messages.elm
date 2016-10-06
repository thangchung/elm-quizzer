module Quizzes.Messages exposing (..)

import Http
import Quizzes.Models exposing (QuizzId, Quizz)


type Msg
    = FetchQuizzesDone (List Quizz)
    | FetchQuizzesFail Http.Error
    | ShowQuizzes
    | ShowQuizz QuizzId
