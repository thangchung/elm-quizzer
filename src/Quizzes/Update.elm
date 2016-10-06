module Quizzes.Update exposing (..)

import Quizzes.Messages exposing (Msg(..))
import Quizzes.Models exposing (Quizz, QuizzId)
import Navigation


update : Msg -> List Quizz -> ( List Quizz, Cmd Msg )
update message quizzes =
    case message of
        FetchQuizzesDone newQuizzes ->
            ( newQuizzes, Cmd.none )

        FetchQuizzesFail error ->
            ( quizzes, Cmd.none )

        ShowQuizzes ->
            ( quizzes, Navigation.newUrl "#quizzes" )

        ShowQuizz id ->
            ( quizzes, Navigation.newUrl ("#quizzes/" ++ (toString id)) )
