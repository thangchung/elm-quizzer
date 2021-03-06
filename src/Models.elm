module Models exposing (Model, QuizzesModel, initialModel)

import Quizzes.Types exposing (Quizz, Question)
import Routing


type alias Model =
    { quizzesModel : QuizzesModel
    , route : Routing.Route
    }


type alias QuizzesModel =
    { quizzes : List Quizz
    , totalQuestions : List Question
    , currentQuestion : Maybe Question
    , currentQuestionIndex : Int
    , totalTime : Int
    }


initialModel : Routing.Route -> Model
initialModel route =
    { quizzesModel =
        { quizzes = []
        , totalQuestions = []
        , currentQuestion = Nothing
        , currentQuestionIndex = 0
        , totalTime = 60
        }
    , route = route
    }
