module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Quizzes.List
import Quizzes.Models exposing (QuizzId)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        QuizzesRoute ->
            Html.App.map QuizzesMsg (Quizzes.List.view model.quizzes)

        QuizzRoute id ->
            notFoundView

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
