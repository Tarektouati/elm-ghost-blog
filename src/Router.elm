module Router exposing (Route(..), fromUrl)

import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, string, top)


type Route
    = Home
    | Article String
    | Notfound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Home top
        , map Article (s "article" </> string)
        ]


fromUrl : Url -> Route
fromUrl url =
    { url | path = Maybe.withDefault "" (Just url.path), fragment = Nothing }
        |> parse routeParser
        |> toRoute


toRoute : Maybe Route -> Route
toRoute route =
    case route of
        Nothing ->
            Notfound

        Just url ->
            url
