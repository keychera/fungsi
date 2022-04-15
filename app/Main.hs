module Main where

main :: IO ()
main = putStrLn myhtml

myhtml = makeHtml "A title" "some content"

makeHtml title content = html_ (head_ (title_ title) <> body_ content)

head_ content = "<head>" <> content <> "</head>"

title_ content = "<title>" <> content <> "</title>"

html_ content = "<html>" <> content <> "</html>"

body_ content = "<body>" <> content <> "</body>"

