module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.element { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL


type alias Model =
    { value : Int }


init : Int -> ( Model, Cmd Msg )
init int =
    ( { value = int }, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | value = model.value + 1 }, Cmd.none )

        Decrement ->
            ( { model | value = model.value - 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ button [ onClick Decrement ] [ text "-" ], div [] [ text (String.fromInt model.value) ], button [ onClick Increment ] [ text "+" ] ]
