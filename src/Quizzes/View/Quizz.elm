module Quizzes.View.Quizz exposing (..)

import Html exposing (..)
import Quizzes.Models exposing (..)
import Quizzes.Messages exposing (..)


view : Quizz -> Html Msg
view quizz =
    div [] [ text (toString quizz.name) ]
