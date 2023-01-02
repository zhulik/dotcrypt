let some_variable = "some value'"

in  { some_string = some_variable
    , some_record =
      { some_string = some_variable
      , some_naturals = [ 1, 2, 3 ]
      , some_doubles = [ 1.2, 2.3 ]
      , some_strings = [ "value1", "value2" ]
      , some_nil = None
      }
    }
