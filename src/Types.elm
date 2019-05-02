module Types exposing (Flags, Model)

import API.Ghost exposing (Endpoint, Post, Settings)


type alias Model =
    { api : Endpoint
    , posts : List Post
    , settings : Settings
    }


type alias Flags =
    { api : String
    , key : String
    }
