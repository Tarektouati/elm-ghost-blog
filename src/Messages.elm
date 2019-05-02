module Messages exposing (Msg(..))

import API.Ghost exposing (Post, Settings)
import Http


type Msg
    = GotPosts (Result Http.Error (List Post))
    | GotSettings (Result Http.Error Settings)
