ls = require("luasnip")
ls.add_snippets("autohotkey", {
  ls.snippet("ahk2", {
    ls.text_node("#Requires AutoHotkey v2.0"),
  }),
})
ls.add_snippets("elm", {
  ls.snippet("elmhome", {
    ls.text_node({
      "module HomePage exposing (..)",
      "",
      "-- Run elm reactor to test this code",
      "import Browser",
      "import Html exposing (Html, button, div, text)",
      "import Html.Events exposing (onClick)",
      "",
      "main =",
      "  Browser.sandbox { init = 0, update = update, view = view }",
      "",
      "type Msg = Increment | Decrement",
      "",
      "update msg model =",
      "  case msg of",
      "    Increment ->",
      "      model + 1",
      "",
      "    Decrement ->",
      "      model - 1",
      "",
      "view model =",
      "  div []",
      '    [ button [ onClick Decrement ] [ text "-" ]',
      "    , div [] [ text (String.fromInt model) ]",
      '    , button [ onClick Increment ] [ text "+" ]',
      "    ]",
    }),
  }),
})
