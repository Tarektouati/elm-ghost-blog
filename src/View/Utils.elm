module View.Utils exposing (backgourndImage)


backgourndImage : String -> String
backgourndImage coverImage =
    "url(" ++ coverImage ++ ")"
