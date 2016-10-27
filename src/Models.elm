module Models exposing (Model, QuizzesModel, initialModel)

import Quizzes.Types exposing (Quizz, Question)
import Routing
import Time exposing (Time)


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
    , time' : Time
    }


initialModel : Routing.Route -> Model
initialModel route =
    { quizzesModel =
        { quizzes = []
        , totalQuestions = []
        , currentQuestion = Nothing
        , currentQuestionIndex = 0
        , totalTime = 60
        , time' = 0
        }
    , route = route
    }
