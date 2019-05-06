module Pages.Article exposing (articlePage)

import API.Ghost exposing (Author, Post, Settings)
import Browser exposing (Document)
import Html exposing (Html, a, div, h2, h5, img, p, span, text)
import Html.Attributes exposing (class, href, property, src)
import Html.Parser exposing (Node, run)
import Html.Parser.Util exposing (toVirtualDom)
import Json.Encode
import List
import Types exposing (Model)
import View.Footer exposing (footer)
import View.Header exposing (header)


articlePage : Settings -> Post -> Document msg
articlePage settings post =
    { title = post.title
    , body =
        [ div []
            [ header settings
            , div [ class "post" ] [ articleHead post.title, articleBody post ]
            , div [ class "author" ] [ articleAuthor post.authors ]
            , footer settings
            ]
        ]
    }


articleHead : String -> Html msg
articleHead title =
    div [ class "post-head" ]
        [ h2 [ class "title" ] [ text title ]
        ]


articleAuthor : List Author -> Html msg
articleAuthor authors =
    let
        maybeAuthor =
            List.head authors
    in
    case maybeAuthor of
        Just { name, profile_image, bio } ->
            div [ class "card author-card" ]
                [ div [ class "media" ]
                    [ img [ class "mr-4 author-img", src profile_image ] []
                    , div [ class "media-body author-body" ]
                        [ h5 [ class "mt-0 mb-1 author-name" ] [ text name ]
                        , span [ class "author-bio" ] [ text bio ]
                        ]
                    ]
                ]

        Nothing ->
            div [] []


toHmtl : String -> List (Html msg)
toHmtl html =
    let
        result =
            run html
    in
    case result of
        Ok elmHtml ->
            toVirtualDom elmHtml

        Err _ ->
            [ div [] [ text "Ouups can't render article content" ] ]


articleBody : Post -> Html msg
articleBody { title, feature_image, html } =
    div []
        [ img [ src feature_image, class "featured-img" ] []
        , div [ class "card col-10" ]
            [ div [ class "card-body" ]
                [ div [ class "card-text article-content" ]
                    [ div [] (toHmtl html)
                    ]
                ]
            ]
        ]
