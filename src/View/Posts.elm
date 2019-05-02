module View.Posts exposing (initialPostView, postListView)

import API.Ghost exposing (Post)
import Html exposing (Html, a, div, h2, h3, h5, img, p, span, text)
import Html.Attributes exposing (class, href, src, style)
import List
import View.Utils exposing (createLink)


initialPostView : Maybe Post -> Html msg
initialPostView post =
    case post of
        Nothing ->
            noPostView

        Just fPost ->
            firstPostView fPost


noPostView : Html msg
noPostView =
    div [] [ text "nothing" ]


firstPostView : Post -> Html msg
firstPostView { title, feature_image, custom_excerpt, id } =
    div [ class "row no-margin" ]
        [ div [ class "col" ] []
        , div [ class "col-5 align-self-center" ]
            [ a [ href (createLink id) ]
                [ div [ class "card  text-white first-post" ]
                    [ img [ src feature_image, class "card-img border-radius" ] []
                    , div [ class "card-img-overlay overlay-black border-radius content-center" ]
                        [ h2 [ class "card-title center-title " ] [ text title ]
                        , span [ class "card-text hide-content" ] [ text custom_excerpt ]
                        ]
                    ]
                ]
            ]
        , div [ class "col" ] []
        ]


postListView : Maybe (List Post) -> Html msg
postListView posts =
    case posts of
        Nothing ->
            noPostView

        Just otherPosts ->
            div [ class "container-fluid post-list" ]
                [ div [ class "row" ] (List.map simplePostView otherPosts)
                ]


simplePostView : Post -> Html msg
simplePostView { feature_image, title, custom_excerpt, id } =
    div [ class "col s12 m4" ]
        [ a [ href (createLink id) ]
            [ div [ class "card post-card" ]
                [ img [ src feature_image, class "card-img-top" ] []
                , div [ class "card-body" ]
                    [ h5 [ class "card-title" ] [ text title ]
                    , p [ class "card-text" ] [ text custom_excerpt ]
                    ]
                ]
            ]
        ]
