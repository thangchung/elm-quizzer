module Quizzes.View.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, attribute, href, style)
import Html.Events exposing (onClick)
import Html.Lazy exposing (lazy, lazy2)
import Models exposing (Model)
import Quizzes.Messages exposing (..)
import Quizzes.Types exposing (Quizz)
import Shared.PageHeader exposing (pageHeaderDetails)


view : Model -> Html Msg
view model =
    case model.quizzesModel of
        quizzesModel ->
            div
                [ class "container-fluid" ]
                [ pageHeaderDetails quizzHeaderTitle quizzHeaderDescription
                , lazy quizzList quizzesModel.quizzes
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
                    , th [] []
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
        , td [] [ button [ class "btn btn-primary btn-xs", onClick (DoQuizz quizz.id) ] [ text "Test" ] ]
        ]
