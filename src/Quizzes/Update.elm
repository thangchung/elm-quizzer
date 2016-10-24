module Quizzes.Update exposing (..)

import Models exposing (Model, QuizzesModel)
import Quizzes.Messages exposing (Msg(..))
import Navigation


update : Model -> QuizzesModel -> Msg -> ( QuizzesModel, Cmd Msg )
update model quizzesModel message =
    case message of
        FetchQuizzesDone newQuizzes ->
            ( { quizzesModel | quizzes = newQuizzes }, Cmd.none )

        FetchQuizzesFail ->
            ( quizzesModel, Cmd.none )

        ShowQuizzes ->
            ( quizzesModel, Navigation.newUrl "#quizzes" )

        ShowQuizz id ->
            ( quizzesModel, Navigation.newUrl ("#quizzes/" ++ (toString id)) )

        DoQuizz id ->
            let
                maybeQuizz =
                    quizzesModel.quizzes
                        |> List.filter (\quizz -> quizz.id == id)
                        |> List.head
            in
                case maybeQuizz of
                    Just quizz ->
                        let
                            maybeQuestion =
                                quizz.questions
                                    |> List.head
                        in
                            ( { quizzesModel
                                | currentQuestion = maybeQuestion
                                , currentQuestionIndex = 1
                              }
                            , Navigation.newUrl ("#test/" ++ (toString id))
                            )

                    Nothing ->
                        ( quizzesModel, Navigation.newUrl "#quizzes" )
