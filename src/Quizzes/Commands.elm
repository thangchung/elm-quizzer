module Quizzes.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import Task
import Quizzes.Models exposing (Quizz, QuizzId)
import Quizzes.Messages exposing (..)


fetchQuizzes : Cmd Msg
fetchQuizzes =
    Http.get quizzesDecoder fetchQuizzesUrl
        |> Task.perform FetchQuizzesFail FetchQuizzesDone


fetchQuizzesUrl : String
fetchQuizzesUrl =
    "http://localhost:8000/quizzes"


{-| Encode & Decode functionalities.
-}
quizzesDecoder : Decode.Decoder (List Quizz)
quizzesDecoder =
    Decode.list quizzDecoder


quizzDecoder : Decode.Decoder Quizz
quizzDecoder =
    Decode.object3 Quizz
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("description" := Decode.string)


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
