# frozen_string_literal: true

module Dotcrypt::Dhall
  using Dotcrypt::Dhall::AsHash

  class << self
    def load(dhall)
      Dhall.load(dhall).sync.as_hash
    end

    def load_from(file)
      load(File.read(file))
    end
  end
end
