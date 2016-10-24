module Quizzes.View.Test exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Quizzes.Types exposing (..)
import Quizzes.Messages exposing (..)


view : Model -> Quizz -> Html Msg
view model quizz =
    case model.quizzesModel.currentQuestion of
        Just question ->
            (renderQuestion question)

        Nothing ->
            div [] []


renderQuestion : Question -> Html Msg
renderQuestion question =
    div []
        [ div [ class "row" ]
            [ div [ class "panel panel-primary" ]
                [ div [ class "panel-heading" ]
                    [ b []
                        [ text question.name ]
                    ]
                , div [ class "panel-body" ]
                    [ div []
                        (List.map renderOption question.options)
                    ]
                ]
            ]
        ]


renderOption : Option -> Html Msg
renderOption option =
    div [ class "form-group" ]
        [ div [ class "radio" ]
            [ label []
                [ input [ name "question1", type' "radio", value "option1" ]
                    []
                , b []
                    [ text option.name ]
                ]
            ]
        ]
