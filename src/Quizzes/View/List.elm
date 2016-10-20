module Quizzes.View.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, attribute, href, style)
import Html.Events exposing (onClick)
import Html.Lazy exposing (lazy, lazy2)
import Quizzes.Messages exposing (..)
import Quizzes.Types exposing (Quizz)
import Shared.PageHeader exposing (pageHeaderDetails)


view : List Quizz -> Html Msg
view quizzes =
    div
        [ class "container-fluid" ]
        [ pageHeaderDetails quizzHeaderTitle quizzHeaderDescription
        , lazy quizzList quizzes
        ]


quizzHeaderTitle : String
quizzHeaderTitle =
    " Quizz List"


quizzHeaderDescription : String
quizzHeaderDescription =
    " all the quizzes in this system..."


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
