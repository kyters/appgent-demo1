{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

module Handler.Person where

import Import

import           Data.Text (Text)
import           Yesod

--getPersonR :: Text -> Handler TypedContent
getPersonR :: Handler TypedContent
getPersonR = selectRep $ do
    provideRep $ return
        [shamlet|
            <p>Hello, my name is #{name} and I am #{age} years old.
        |]
    provideRep $ return $ object
        [ "name" .= name
        , "age" .= age
        ]
  where
    name = "Dieter" :: Text
    age = 30 :: Int

