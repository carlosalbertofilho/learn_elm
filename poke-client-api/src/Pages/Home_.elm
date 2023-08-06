module Pages.Home_ exposing (Model, Msg, page)

import Api
import Html exposing (Html)
import Page exposing (Page)
import View exposing (View)


page : Page Model Msg
page =
    Page.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Model =
    { pokemonData : Api.Data (List Pokemon)
    }


type alias Pokemon =
    { name : String
    }


init : ( Model, Cmd Msg )
init =
    ( { pokemonData = Api.Loading }
    , Cmd.none
    )



-- UPDATE


type Msg
    = ExampleMsgReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ExampleMsgReplaceMe ->
            ( model
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Pokemon"
    , body =
        case model.pokemonData of
            Api.Loading ->
                [ Html.text "Loading..." ]

            Api.Sucess listOfPokemon ->
                let
                    count : Int
                    count =
                        List.length listOfPokemon
                in
                [ Html.text ("Fetched " ++ String.fromInt count ++ " pokemons! ") ]

            Api.Failure httpError ->
                [ Html.text "Something went wrong" ]
    }
