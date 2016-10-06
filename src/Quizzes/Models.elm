module Quizzes.Models exposing (..)


type alias QuizzId =
    Int


type alias Quizz =
    { id : Int
    , name : String
    , description : String
    }


new : Quizz
new =
    { id = 0
    , name = ""
    , description = ""
    }
