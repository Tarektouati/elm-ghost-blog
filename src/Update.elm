module Update exposing (update)

import API.Ghost exposing (Endpoint, getPost, getPosts)
import Browser
import Browser.Navigation as Nav
import List
import Messages exposing (Msg(..))
import Router exposing (Route(..), fromUrl)
import Types exposing (Model)
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotPosts response ->
            case response of
                Ok posts ->
                    ( { model | posts = posts }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        GotSettings response ->
            case response of
                Ok settings ->
                    ( { model | settings = settings }, fetchDataByRoute model.url model.api )

                Err _ ->
                    ( model, Cmd.none )

        GotPost response ->
            case response of
                Ok posts ->
                    ( { model | post = List.head posts }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            let
                route =
                    fromUrl url
            in
            ( { model | url = route }
            , fetchDataByRoute route model.api
            )


fetchDataByRoute : Route -> Endpoint -> Cmd Msg
fetchDataByRoute route api =
    case route of
        Home ->
            getPosts api GotPosts

        Article id ->
            getPost id api GotPost

        Notfound ->
            Cmd.none
