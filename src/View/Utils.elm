module View.Utils exposing (backgourndImage, createLink)


backgourndImage : String -> String
backgourndImage coverImage =
    "url(" ++ coverImage ++ ")"


createLink : String -> String
createLink id =
    "/article/" ++ id


