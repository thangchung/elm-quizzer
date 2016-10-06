module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Quizzes.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        QuizzesMsg subMsg ->
            let
                ( updatedQuizzes, cmd ) =
                    Quizzes.Update.update subMsg model.quizzes
            in
                ( { model | quizzes = updatedQuizzes }, Cmd.map QuizzesMsg cmd )
