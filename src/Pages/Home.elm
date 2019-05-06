module Pages.Home exposing (home)

import API.Ghost exposing (Post, Settings)
import Browser exposing (Document)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import List
import Types exposing (Model)
import View.Footer exposing (footer)
import View.Header exposing (homeHeader)
import View.Posts exposing (initialPostView, postListView)


getFirstPost : List Post -> Maybe Post
getFirstPost posts =
    List.head posts


getPostsRest : List Post -> Maybe (List Post)
getPostsRest posts =
    List.tail posts


home : Settings -> List Post -> Document msg
home settings posts =
    { title = "Home"
    , body =
        [ div []
            [ homeHeader settings
            , div [] [ initialPostView (getFirstPost posts), postListView (getPostsRest posts) ]
            , footer settings
            ]
        ]
    }
