module Main where

import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "My title"
    ( append_
        (h1_ "Heading")
        ( append_
            (p_ "Paragraph #1")
            ( append_
                (code_ "code #2 that has <>")
                -- (p_ "Paragraph #2 that has <>")
                (ul_ (map (listItem . show) [1 .. 10]))
            )
        )
    )

listItem :: String -> Structure
listItem content = p_ ("item #" <> content)