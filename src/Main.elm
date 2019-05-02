module Main exposing (init, main)

import API.Ghost exposing (defualtSettings, getSettings)
import Browser exposing (element)
import Messages exposing (Msg(..))
import Types exposing (Flags, Model)
import Update exposing (update)
import View exposing (view)



---- MODEL ----


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        model =
            { api = { url = flags.api, key = flags.key }
            , posts = []
            , settings = defualtSettings
            }
    in
    ( model
    , getSettings model.api GotSettings
    )



---- PROGRAM ----


main : Program Flags Model Msg
main =
    element
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
