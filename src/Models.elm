module Models exposing (Model, QuizzesModel, initialModel)

import Quizzes.Types exposing (Quizz, Question)
import Routing


type alias Model =
    { quizzesModel : QuizzesModel
    , route : Routing.Route
    }


type alias QuizzesModel =
    { quizzes : List Quizz
    , currentQuestion : Maybe Question
    , currentQuestionIndex : Int
    }


initialModel : Routing.Route -> Model
initialModel route =
    { quizzesModel =
        { quizzes = []
        , currentQuestion = Nothing
        , currentQuestionIndex = 0
        }
    , route = route
    }
