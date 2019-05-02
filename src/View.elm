module View exposing (view)

import API.Ghost exposing (Post)
import Browser exposing (Document)
import Html exposing (Html)
import List
import Pages.Article as K
import Pages.Home exposing (home)
import Pages.Notfound exposing (notfound)
import Router exposing (Route(..))
import Types exposing (Model)


getFirstPost : List Post -> Maybe Post
getFirstPost posts =
    List.head posts


getPostsRest : List Post -> Maybe (List Post)
getPostsRest posts =
    List.tail posts


view : Model -> Browser.Document msg
view model =
    case model.url of
        Home ->
            home model.settings model.posts

        Article id ->
            K.notfound model.settings

        Notfound ->
            notfound model.settings
