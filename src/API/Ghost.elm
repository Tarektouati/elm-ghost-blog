module API.Ghost exposing (Endpoint, Post, Settings, defualtSettings, getPost, getPosts, getSettings)

import Http
import Json.Decode exposing (Decoder, field)


type alias Settings =
    { title : String
    , description : String
    , cover_image : String
    , lang : String
    , logo : String
    }


defualtSettings : Settings
defualtSettings =
    { title = ""
    , description = ""
    , cover_image = ""
    , lang = ""
    , logo = ""
    }


type alias Post =
    { title : String
    , feature_image : String
    , id : String
    , custom_excerpt : String
    }


type alias Endpoint =
    { key : String
    , url : String
    }


urlBuilder : Endpoint -> String -> String
urlBuilder { key, url } path =
    url ++ "/ghost/api/v2" ++ path ++ "?key=" ++ key


settingsDecoder : Decoder Settings
settingsDecoder =
    let
        decoder =
            Json.Decode.map5 Settings
                (field "title" Json.Decode.string)
                (field "description" Json.Decode.string)
                (field "cover_image" Json.Decode.string)
                (field "lang" Json.Decode.string)
                (field "logo" Json.Decode.string)
    in
    Json.Decode.at [ "settings" ] decoder


postDecoder : Decoder Post
postDecoder =
    Json.Decode.map4 Post
        (field "title" Json.Decode.string)
        (field "feature_image" Json.Decode.string)
        (field "id" Json.Decode.string)
        (field "custom_excerpt" Json.Decode.string)


postsDecoder : Decoder (List Post)
postsDecoder =
    let
        decoder =
            Json.Decode.list postDecoder
    in
    Json.Decode.at [ "posts" ] decoder


getPosts : Endpoint -> (Result Http.Error (List Post) -> msg) -> Cmd msg
getPosts endpoint toMsg =
    Http.get
        { url =
            urlBuilder
                endpoint
                "/content/posts/"
        , expect = Http.expectJson toMsg postsDecoder
        }


getSettings : Endpoint -> (Result Http.Error Settings -> msg) -> Cmd msg
getSettings endpoint toMsg =
    Http.get
        { url =
            urlBuilder
                endpoint
                "/content/settings/"
        , expect = Http.expectJson toMsg settingsDecoder
        }


getPost : String -> Endpoint -> (Result Http.Error (List Post) -> msg) -> Cmd msg
getPost id endpoint toMsg =
    Http.get
        { url =
            urlBuilder
                endpoint
                ("/content/posts/" ++ id)
        , expect = Http.expectJson toMsg postsDecoder
        }
