module Shared.NavBar exposing (Msg(..), update, view)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Routing exposing (..)


type Msg
    = Dashboard


update : Msg -> a -> ( a, Cmd b )
update msg model =
    case msg of
        Dashboard ->
            ( model, Navigation.newUrl "#" )


msgToRoute : Msg -> Route
msgToRoute msg =
    case msg of
        Dashboard ->
            QuizzesRoute


view : Route -> Html Msg
view currentRoute =
    nav [ class "navbar navbar-default navbar-fixed-top" ]
        [ div [ class "container-fluid" ]
            [ div [ class "navbar-header" ]
                [ button
                    [ type' "button"
                    , class "navbar-toggle collapsed"
                    , attribute "data-toggle" "collapse"
                    , attribute "data-target" "#bs-example-navbar-collapse-1"
                    , attribute "aria-expanded" "false"
                    ]
                    [ span [ class "sr-only" ] [ text "Toggle navigation" ]
                    , span [ class "icon-bar" ] []
                    , span [ class "icon-bar" ] []
                    , span [ class "icon-bar" ] []
                    ]
                , div [ onClick Dashboard ]
                    [ a
                        [ class "navbar-brand"
                        ]
                        [ text "Quizzer" ]
                    ]
                ]
            , div [ class "collapse navbar-collapse", id "bs-example-navbar-collapse-1" ]
                [ ul [ class "nav navbar-nav navbar-right" ]
                    [ li
                        []
                        [ a [ href "#" ] [ text "Logged in as trainee" ] ]
                    ]
                ]
            ]
        ]
