# frozen_string_literal: true

class Dotcrypt::Serializers::Serializer
  def self.call(...) = new(...).call

  def initialize(config)
    @config = config
  end

  def call = raise NotImplementedError
end
