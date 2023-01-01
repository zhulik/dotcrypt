# frozen_string_literal: true

require "json"

require "zeitwerk"

require "dhall"

loader = Zeitwerk::Loader.for_gem

loader.setup

class Dotcrypt::Error < StandardError
  # Your code goes here...
end
