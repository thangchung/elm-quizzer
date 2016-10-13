module Shared.Footer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, attribute)


view : Html a
view =
    footer []
        [ div [ class "container-fluid" ]
            [ p [ class "pull-left", attribute "style" "margin-top: 10px;" ]
                [ text "Copyright 2016 by @thangchung    " ]
            ]
        ]
