module Main where

main :: IO ()
main = putStrLn myhtml

myhtml :: String
myhtml = makeHtml "A title" "some updated content"

makeHtml :: String -> String -> String
makeHtml title content =
  html_
    ( head_
        (title_ title)
        <> body_ (h1_ content)
    )

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
