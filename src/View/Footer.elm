module View.Footer exposing (footer)

import API.Ghost exposing (Settings)
import Html exposing (Html, div, h1, h3, img, text)
import Html.Attributes exposing (class, src, style)
import Task
import Time


copyRight : String
copyRight =
    String.fromChar (Char.fromCode 169)


footer : Settings -> Html msg
footer { title } =
    div [ class "footer" ]
        [ div [ class "footer-inner" ]
            [ h3 [ class "footer-description" ] [ text (title ++ " " ++ copyRight ++ " 2019") ]
            ]
        ]
