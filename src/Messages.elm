module Messages exposing (Msg(..))

import Quizzes.Messages as QuizzesMessages
import Shared.NavBar as NavBar


type Msg
    = NavBarMessage NavBar.Msg
    | QuizzesMsg QuizzesMessages.Msg
