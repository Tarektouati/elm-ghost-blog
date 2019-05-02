module Types exposing (Flags, Model)

import API.Ghost exposing (Endpoint, Post, Settings)
import Browser.Navigation exposing (Key)
import Router exposing (Route)


type alias Model =
    { api : Endpoint
    , posts : List Post
    , settings : Settings
    , post : Maybe Post
    , key : Key
    , url : Route
    }


type alias Flags =
    { api : String
    , key : String
    }
