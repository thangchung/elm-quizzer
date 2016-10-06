module Models exposing (..)

import Quizzes.Models exposing (Quizz)
import Routing


type alias Model =
    { quizzes : List Quizz
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { quizzes = []
    , route = route
    }
