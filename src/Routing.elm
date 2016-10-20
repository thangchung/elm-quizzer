module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)
import Quizzes.Types exposing (QuizzId)


type Route
    = QuizzesRoute
    | QuizzRoute QuizzId
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ format QuizzesRoute (s "")
        , format QuizzRoute (s "quizzes" </> int)
        , format QuizzesRoute (s "quizzes")
        ]


hashParser : Navigation.Location -> Result String Route
hashParser location =
    location.hash
        |> String.dropLeft 1
        |> parse identity matchers


parser : Navigation.Parser (Result String Route)
parser =
    Navigation.makeParser hashParser


routeFromResult : Result String Route -> Route
routeFromResult result =
    case result of
        Ok route ->
            route

        Err string ->
            NotFoundRoute
