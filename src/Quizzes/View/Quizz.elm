module Quizzes.View.Quizz exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Quizzes.Types exposing (..)
import Quizzes.Messages exposing (..)


view : Quizz -> Html Msg
view quizz =
    div [ class "well", attribute "style" "margin-top: 50px;" ]
        [ h1 []
            [ b []
                [ text quizz.name ]
            ]
        , span [ class "label label-default" ]
            [ text "Admin on Oct 8th, 11:53" ]
        , div []
            [ text quizz.description ]
        , div [ attribute "aria-label" "...", class "btn-group", attribute "role" "group" ]
            [ button [ class "btn btn-default btn-xs", type' "button" ]
                [ span [ attribute "aria-hidden" "true", class "glyphicon glyphicon-star" ]
                    []
                , text "Like"
                ]
            , button [ class "btn btn-default btn-xs", type' "button" ]
                [ text "Dislike" ]
            ]
        , button [ class "btn btn-primary btn-xs", type' "button" ]
            [ text "Share" ]
        , div [ class "pull-right" ]
            [ span [ class "label label-primary" ]
                [ text "1 LIKES" ]
            , span [ class "label label-default" ]
                [ text "0 DISLIKES" ]
            ]
        , div [ class "container", attribute "style" "margin-top: 10px;" ]
            (List.map renderQuestion quizz.questions)
        , div [] []
        ]


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
