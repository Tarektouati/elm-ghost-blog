module Pages.Notfound exposing (notfound)

import API.Ghost exposing (Settings)
import Browser exposing (Document)
import Html exposing (Html, a, div, h2, span, text)
import Html.Attributes exposing (class, href)
import List
import Types exposing (Model)
import View.Footer exposing (footer)
import View.Header exposing (header)


notfound : Settings -> Document msg
notfound settings =
    { title = "Not found"
    , body =
        [ div []
            [ header settings
            , div [] [ notfoundPage settings ]
            , footer settings
            ]
        ]
    }


notfoundPage : Settings -> Html msg
notfoundPage settings =
    div [ class "notfound-block" ]
        [ h2 [ class "notfound-error" ] [ text "404" ]
        , span [ class "notfound-content" ] [ text "Page not found" ]
        , a [ href "/" ] [ text "Go to the front page →" ]
        ]
