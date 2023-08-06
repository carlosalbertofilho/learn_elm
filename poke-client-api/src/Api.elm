module Api exposing (..)

import Http


type Data value
    = Loading -- page make request for PokeApi
    | Sucess value -- get a data from request
    | Failure Http.Error -- Something went wrong
