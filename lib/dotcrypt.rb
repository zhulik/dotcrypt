# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem

loader.setup

class Dotcrypt::Error < StandardError
  # Your code goes here...
end
