module Pages.Converter exposing (Model, Msg, page)

import FormatNumber exposing (format)
import FormatNumber.Locales exposing (Decimals(..), Locale, spanishLocale)
import Html exposing (Html, button, div, h1, h2, input, label, section, text)
import Html.Attributes exposing (class, for, name, type_, value)
import Html.Events exposing (onInput)
import Page exposing (Page)
import View exposing (View)


page : Page Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { fahrenheitFieldValid : Bool
    , celsiusFieldValid : Bool
    , fahrenheitFieldValue : String
    , celsiusFieldValue : String
    , fahrenheit : Float
    , celsius : Float
    }


init : Model
init =
    { fahrenheitFieldValid = True
    , celsiusFieldValid = True
    , fahrenheitFieldValue = "32"
    , celsiusFieldValue = "0"
    , fahrenheit = 32
    , celsius = 0
    }



-- UPDATE


type Msg
    = FahrenheitToCelsius String
    | CelsiusToFahrenheit String


update : Msg -> Model -> Model
update msg model =
    let
        fahrenheitToCelsius fahrenheit =
            (fahrenheit - 32) / 1.8

        celsiusToFahrenheit celsius =
            (celsius * 1.8) + 32
    in
    case msg of
        FahrenheitToCelsius userInput ->
            case String.toFloat userInput of
                Just number ->
                    { model
                        | fahrenheit = number
                        , celsius = fahrenheitToCelsius number
                        , fahrenheitFieldValue = userInput
                        , fahrenheitFieldValid = True
                        , celsiusFieldValid = True
                    }

                Nothing ->
                    { model
                        | fahrenheitFieldValue = userInput
                        , fahrenheitFieldValid = False
                    }

        CelsiusToFahrenheit userInput ->
            case String.toFloat userInput of
                Just number ->
                    { model
                        | celsius = number
                        , fahrenheit = celsiusToFahrenheit number
                        , celsiusFieldValue = userInput
                        , fahrenheitFieldValid = True
                        , celsiusFieldValid = True
                    }

                Nothing ->
                    { model
                        | celsiusFieldValue = userInput
                        , celsiusFieldValid = False
                    }



-- VIEW


view : Model -> View Msg
view model =
    let
        getFieldValidClass isFieldValid =
            if isFieldValid then
                "input"

            else
                "input is-danger"

        formatTemperature number =
            format { spanishLocale | decimals = Max 1 } number

        viewFahrenheit =
            if model.fahrenheitFieldValid then
                formatTemperature model.fahrenheit

            else
                model.fahrenheitFieldValue

        viewCelsius =
            if model.celsiusFieldValid then
                formatTemperature model.celsius

            else
                model.celsiusFieldValue
    in
    { title = "Converte de Fº para C º"
    , body =
        [ section [ class "section" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ] [ text "Conversor de Temperatura" ]
                , h2 [ class "subtitle" ] [ text "Converte de Fº para Cº" ]
                , label [ for "fahrenheit", class "label" ] [ text "Fahrenheit" ]
                , input
                    [ name "fahrenheit"
                    , type_ "text"
                    , onInput FahrenheitToCelsius
                    , value viewFahrenheit
                    , class (getFieldValidClass model.fahrenheitFieldValid)
                    ]
                    []
                , label [ for "celsius", class "label" ] [ text "Celsius" ]
                , input
                    [ name "celsius"
                    , type_ "text"
                    , onInput CelsiusToFahrenheit
                    , value viewCelsius
                    , class (getFieldValidClass model.celsiusFieldValid)
                    ]
                    []
                ]
            ]
        ]
    }
