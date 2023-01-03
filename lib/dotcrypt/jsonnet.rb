# frozen_string_literal: true

module Dotcrypt::Jsonnet
  class << self
    def load(code) = Jsonnet.evaluate(code)

    def load_from(file) = load(File.read(file))
  end
end
