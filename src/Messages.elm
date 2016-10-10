module Messages exposing (..)

import Quizzes.Messages
import Shared.NavBar as NavBar


type Msg
    = NavBarMessage NavBar.Msg
    | QuizzesMsg Quizzes.Messages.Msg
