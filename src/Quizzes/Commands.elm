module Quizzes.Commands exposing (..)

import Json.Decode as Decode exposing ((:=), andThen)
import Json.Encode as Encode
import Task
import Quizzes.Types exposing (Quizz, Question, QuestionType(..), Option)
import Quizzes.Messages exposing (..)
import HttpBuilder exposing (jsonReader, stringReader)


loadQuizzes : Cmd Msg
loadQuizzes =
    HttpBuilder.get fetchQuizzesUrl
        |> HttpBuilder.send quizzesReader stringReader
        |> Task.map .data
        |> Task.perform (always FetchQuizzesFail) FetchQuizzesDone


fetchQuizzesUrl : String
fetchQuizzesUrl =
    "http://localhost:8000/quizzes"


quizzesReader : HttpBuilder.BodyReader (List Quizz)
quizzesReader =
    jsonReader <| Decode.list quizzDecoder


quizzDecoder : Decode.Decoder Quizz
quizzDecoder =
    Decode.object4 Quizz
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("description" := Decode.string)
        ("questions" := Decode.list questionDecoder)


questionDecoder : Decode.Decoder Question
questionDecoder =
    Decode.object4 Question
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("options" := Decode.list optionDecoder)
        ("question_type_id" := Decode.int `andThen` questionTypeDecoder)


questionTypeDecoder : Int -> Decode.Decoder QuestionType
questionTypeDecoder tag =
    case tag of
        1 ->
            Decode.succeed SINGLE_CHOICE

        2 ->
            Decode.succeed MULTIPLE_CHOICE

        _ ->
            Decode.fail ((toString tag) ++ " is not a recognized tag for QuestionType")


optionDecoder : Decode.Decoder Option
optionDecoder =
    Decode.object3 Option
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("is_answer" := Decode.bool)


quizzEncoded : Quizz -> Encode.Value
quizzEncoded quizz =
    let
        list =
            [ ( "id", Encode.int quizz.id )
            , ( "name", Encode.string quizz.name )
            , ( "description", Encode.string quizz.description )
            ]
    in
        list
            |> Encode.object
