# frozen_string_literal: true

require "json"

require "zeitwerk"
require "dhall"
require "thor"

loader = Zeitwerk::Loader.for_gem

loader.inflector.inflect(
  "env" => "ENV",
  "json" => "JSON"
)

loader.setup

class Dotcrypt::Error < StandardError
  # Your code goes here...
end
