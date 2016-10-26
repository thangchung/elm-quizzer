module Quizzes.Update exposing (..)

import Quizzes.Types exposing (Quizz, QuizzId, Question)
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
                    getQuizzById quizzesModel.quizzes id
            in
                case maybeQuizz of
                    Just quizz ->
                        let
                            maybeQuestion =
                                getFirstQuestion quizz.questions
                        in
                            ( { quizzesModel
                                | totalQuestions = quizz.questions
                                , currentQuestion = maybeQuestion
                                , currentQuestionIndex = 1
                              }
                            , Navigation.newUrl ("#test/" ++ (toString id))
                            )

                    Nothing ->
                        ( quizzesModel, Navigation.newUrl "#quizzes" )

        TestClickNext id ->
            let
                maybeQuizz =
                    getQuizzById quizzesModel.quizzes id
            in
                case maybeQuizz of
                    Just quizz ->
                        let
                            ( updatedIndex, maybeQuestion ) =
                                getUpdatedQuestion quizz.questions quizzesModel True
                        in
                            ( { quizzesModel
                                | currentQuestion = maybeQuestion
                                , currentQuestionIndex = Debug.log "currentQuestionIndex" updatedIndex
                              }
                            , Navigation.newUrl ("#test/" ++ (toString id))
                            )

                    Nothing ->
                        ( quizzesModel, Navigation.newUrl "#quizzes" )

        TestClickPrevious id ->
            let
                maybeQuizz =
                    getQuizzById quizzesModel.quizzes id
            in
                case maybeQuizz of
                    Just quizz ->
                        let
                            ( updatedIndex, maybeQuestion ) =
                                getUpdatedQuestion quizz.questions quizzesModel False
                        in
                            ( { quizzesModel
                                | currentQuestion = maybeQuestion
                                , currentQuestionIndex = Debug.log "currentQuestionIndex" updatedIndex
                              }
                            , Navigation.newUrl ("#test/" ++ (toString id))
                            )

                    Nothing ->
                        ( quizzesModel, Navigation.newUrl "#quizzes" )

        CancelTest ->
            ( quizzesModel, Navigation.newUrl ("#") )


getQuizzById : List Quizz -> QuizzId -> Maybe Quizz
getQuizzById quizzes id =
    quizzes
        |> List.filter (\quizz -> quizz.id == id)
        |> List.head


getFirstQuestion : List Question -> Maybe Question
getFirstQuestion questions =
    questions
        |> List.head


getUpdatedQuestion : List Question -> QuizzesModel -> Bool -> ( Int, Maybe Question )
getUpdatedQuestion questions quizzesModel isNext =
    let
        updatedIndex =
            if isNext then
                getNextIndex quizzesModel
            else
                getPreviousIndex quizzesModel

        question =
            List.drop quizzesModel.currentQuestionIndex questions
                |> List.head
    in
        ( updatedIndex, question )


getNextIndex : QuizzesModel -> Int
getNextIndex quizzesModel =
    if
        quizzesModel.currentQuestionIndex
            <= (Debug.log "Length" (List.length quizzesModel.totalQuestions))
    then
        quizzesModel.currentQuestionIndex + 1
    else
        quizzesModel.currentQuestionIndex


getPreviousIndex : QuizzesModel -> Int
getPreviousIndex quizzesModel =
    if quizzesModel.currentQuestionIndex > 1 then
        quizzesModel.currentQuestionIndex - 1
    else
        quizzesModel.currentQuestionIndex
