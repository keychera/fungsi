module Html.Internal where

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el
        "html"
        ( el "head" (el "title" (escape title))
            <> el "body" (getStructureString content)
        )
    )

getStructureString :: Structure -> String
getStructureString (Structure str) = str

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render :: Html -> String
render (Html content) = content

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

ul_ :: [Structure] -> Structure
ul_ = l_ "ul"

ol_ :: [Structure] -> Structure
ol_ = l_ "ol"

code_ :: String -> Structure
code_ = Structure . el "pre"

l_ :: String -> [Structure] -> Structure
l_ listType = Structure . el listType . concatMap (el "li" . getStructureString)

escape :: String -> String
escape =
  let escapeChar c =
        case c of
          '<' -> "&lt;"
          '>' -> "&gt;"
          '&' -> "&amp;"
          '"' -> "&quot;"
          '\'' -> "&#39;"
          _ -> [c]
   in concatMap escapeChar