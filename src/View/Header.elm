module View.Header exposing (header, homeHeader)

import API.Ghost exposing (Settings)
import Html exposing (Html, div, h1, h3, img, text)
import Html.Attributes exposing (class, src, style)
import View.Utils exposing (backgourndImage)


homeHeader : Settings -> Html msg
homeHeader { title, cover_image, logo, description } =
    div [ class "home-header", style "background-image" (backgourndImage cover_image) ]
        [ div [ class "inner" ]
            [ img [ src logo, class "logo" ] []
            , h3 [ class "description" ] [ text description ]
            ]
        ]


header : Settings -> Html msg
header { title, cover_image, logo, description } =
    div [ class "header" ]
        [ div [ class "inner" ]
            [ img [ src logo, class "logo" ] []
            ]
        ]
