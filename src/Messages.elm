module Messages exposing (Msg(..))

import API.Ghost exposing (Post, Settings)
import Browser exposing (UrlRequest)
import Http exposing (Error)
import Url exposing (Url)


type Msg
    = GotPosts (Result Error (List Post))
    | GotPost (Result Error (List Post))
    | GotSettings (Result Error Settings)
    | LinkClicked UrlRequest
    | UrlChanged Url
