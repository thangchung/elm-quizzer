module Shared.PageHeader exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)


pageHeaderDetails : String -> String -> Html a
pageHeaderDetails title description =
    div [ class "page-header" ]
        [ h1 []
            [ i [ class "fa fa-th-large" ] []
            , span []
                [ span [] [ text (" " ++ title) ]
                , small [] [ text (" " ++ description) ]
                ]
            ]
        ]
