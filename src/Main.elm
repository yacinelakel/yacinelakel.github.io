module Main exposing(..)

import Browser
import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Browser exposing (Document)

-- Main
main : Program () Model Msg
main = 
    Browser.document { init = init, update = update, subscriptions=subscriptions, view = view}

-- Model
type alias Model = 
    { showText: Bool}

init: () -> (Model, Cmd Msg)
init _ = 
    (Model False, Cmd.none)

-- Update
type Msg = 
    ToggleText

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ToggleText ->
            ({model | showText =  not model.showText} , Cmd.none)
    

-- View
view : Model -> Document Msg
view model =
    let 
        toggleBtnText = if model.showText then "Hide" else "Show"
        toggleText = if model.showText then "Hello, world!" else ""
    in 
    {title= "GitHub Pages with Elm"
    , body =[
        div []
        [button[onClick ToggleText] [text (toggleBtnText ++ " text")]
        , text toggleText
        ]]
    }

toText: Maybe Int -> String 
toText n = 
    case n of 
        Just i -> 
            String.fromInt i
        Nothing ->
            ""

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none