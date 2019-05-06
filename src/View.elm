module View exposing (view)

import API.Ghost exposing (Post)
import Browser exposing (Document)
import Html exposing (Html)
import List
import Pages.Article exposing (articlePage)
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
            case model.post of
                Nothing ->
                    notfound model.settings

                Just post ->
                    articlePage model.settings post

        Notfound ->
            notfound model.settings
