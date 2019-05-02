module View exposing (view)

import API.Ghost exposing (Post)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import List
import Types exposing (Model)
import View.Footer exposing (footer)
import View.Header exposing (header)
import View.Posts exposing (initialPostView, postListView)


getFirstPost : List Post -> Maybe Post
getFirstPost posts =
    List.head posts


getPostsRest : List Post -> Maybe (List Post)
getPostsRest posts =
    List.tail posts


view : Model -> Html msg
view model =
    div []
        [ header model.settings
        , div [] [ initialPostView (getFirstPost model.posts), postListView (getPostsRest model.posts) ]
        , footer model.settings
        ]
