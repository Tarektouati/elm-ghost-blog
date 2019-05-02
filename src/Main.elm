module Main exposing (init, main)

import API.Ghost exposing (defualtSettings, getSettings)
import Browser exposing (application)
import Browser.Navigation as Nav
import Messages exposing (Msg(..))
import Router exposing (fromUrl)
import Types exposing (Flags, Model)
import Update exposing (update)
import Url
import View exposing (view)



---- MODEL ----


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        model =
            { api = { url = flags.api, key = flags.key }
            , posts = []
            , settings = defualtSettings
            , key = key
            , url = fromUrl url
            , post = Nothing
            }
    in
    ( model
    , getSettings model.api GotSettings
    )



---- PROGRAM ----


main : Program Flags Model Msg
main =
    application
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
