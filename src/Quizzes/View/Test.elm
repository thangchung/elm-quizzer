module Quizzes.View.Test exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time exposing (Time)
import Models exposing (Model)
import Quizzes.Types exposing (..)
import Quizzes.Messages exposing (..)
import Shared.Clock exposing (clock)


view : Model -> Quizz -> Html Msg
view model quizz =
    case model.quizzesModel.currentQuestion of
        Just question ->
            (renderQuestion quizz.id question model.quizzesModel.totalTime model.quizzesModel.time')

        Nothing ->
            div [] [ text "Don't have any question!!!" ]


renderQuestion : QuizzId -> Question -> Int -> Time -> Html Msg
renderQuestion quizzId question totalTime time =
    div []
        [ div
            [ style
                [ ( "margin-top", "10px" )
                , ( "text-align", "center" )
                ]
            ]
            [ clock time ]
        , div [ class "row" ]
            [ div [ class "panel panel-primary" ]
                [ div [ class "panel-heading" ]
                    [ b []
                        [ text question.name ]
                    ]
                , div [ class "panel-body" ]
                    [ div []
                        (List.map renderOption question.options)
                    ]
                , div [ class "panel-footer" ]
                    [ button [ class "btn btn-default", onClick (TestClickPrevious quizzId) ] [ text "Back" ]
                    , button [ class "btn btn-primary", onClick (TestClickNext quizzId) ] [ text "Next" ]
                    , button [ class "btn btn-danger", onClick ConfirmingCancelTest ] [ text "Cancel" ]
                    , span [] [ b [] [ text (toString totalTime) ] ]
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
