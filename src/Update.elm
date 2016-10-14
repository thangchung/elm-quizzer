module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Quizzes.Update
import Shared.NavBar as NavBar


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case Debug.log "QuizzesMsg" message of
        NavBarMessage subMsg ->
            NavBar.update subMsg model
                |> (\( m, c ) -> ( m, Cmd.map NavBarMessage c ))

        QuizzesMsg subMsg ->
            let
                ( updatedQuizzes, cmd ) =
                    Quizzes.Update.update subMsg model.quizzes
            in
                ( { model | quizzes = updatedQuizzes }, Cmd.map QuizzesMsg cmd )
