module Evergreen.V48.Effect.Internal exposing (..)

import Browser.Navigation
import File
import Time


type NavigationKey
    = RealNavigationKey Browser.Navigation.Key
    | MockNavigationKey


type SessionId
    = SessionId String


type ClientId
    = ClientId String


type File
    = RealFile File.File
    | MockFile
        { name : String
        , mimeType : String
        , content : String
        , lastModified : Time.Posix
        }
