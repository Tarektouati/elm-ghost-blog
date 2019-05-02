module Update exposing (update)

import API.Ghost exposing (getPosts)
import Messages exposing (Msg(..))
import Types exposing (Model)


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
                    ( { model | settings = settings }, getPosts model.api GotPosts )

                Err _ ->
                    ( model, Cmd.none )
