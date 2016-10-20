module Quizzes.Types exposing (..)


type alias QuizzId =
    Int


type alias QuestionId =
    Int


type alias OptionId =
    Int


type QuestionType
    = SINGLE_CHOICE
    | MULTIPLE_CHOICE


type alias Quizz =
    { id : QuizzId
    , name : String
    , description : String
    , questions : List Question
    }


type alias Question =
    { id : QuestionId
    , name : String
    , options : List Option
    , questionType : QuestionType
    }


type alias Option =
    { id : OptionId
    , name : String
    , isAnswer : Bool
    }


initOption : Option
initOption =
    { id = 0
    , name = ""
    , isAnswer = False
    }


initQuestion : Question
initQuestion =
    { id = 0
    , name = ""
    , options = [ initOption ]
    , questionType = SINGLE_CHOICE
    }


initQuizz : Quizz
initQuizz =
    { id = 0
    , name = ""
    , description = ""
    , questions = [ initQuestion ]
    }
