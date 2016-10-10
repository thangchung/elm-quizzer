module Quizzes.View.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, attribute, href)
import Html.Events exposing (onClick)
import Quizzes.Messages exposing (..)
import Quizzes.Models exposing (Quizz)


view : List Quizz -> Html Msg
view quizzes =
    div
        [ class "container-fluid"
        , attribute "style" "margin-top: 50px"
        ]
        [ pageHeader
        , quizzList quizzes
        ]


pageHeader : Html Msg
pageHeader =
    div [ class "page-header" ]
        [ h1 []
            [ i [ class "fa fa-th-large" ] []
            , span []
                [ span [] [ text " Quizz List" ]
                , small [] [ text " all the quizzes in this system..." ]
                ]
            ]
        ]


quizzList : List Quizz -> Html Msg
quizzList quizzes =
    div []
        [ table [ class "table table-hover" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Description" ]
                    ]
                ]
            , tbody [] (List.map quizzRow quizzes)
            ]
        ]


quizzRow : Quizz -> Html Msg
quizzRow quizz =
    tr []
        [ td [] [ text (toString quizz.id) ]
        , td []
            [ a
                [ onClick (ShowQuizz quizz.id)
                ]
                [ text quizz.name ]
            ]
        , td [] [ text (quizz.description) ]
        ]
