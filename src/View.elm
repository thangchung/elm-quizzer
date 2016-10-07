module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Quizzes.View.List as QuizzesView
import Quizzes.View.Quizz as QuizzView
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
            Html.App.map QuizzesMsg (QuizzesView.view model.quizzes)

        QuizzRoute id ->
            quizzViewPage model id

        NotFoundRoute ->
            notFoundView


quizzViewPage : Model -> QuizzId -> Html Msg
quizzViewPage model quizzId =
    let
        maybeQuizz =
            model.quizzes
                |> List.filter (\quizz -> quizz.id == quizzId)
                |> List.head
    in
        case maybeQuizz of
            Just quizz ->
                Html.App.map QuizzesMsg (QuizzView.view quizz)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
