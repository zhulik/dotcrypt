# frozen_string_literal: true

module Dotcrypt::Serializers
  SERIALIZERS = {
    json: Dotcrypt::Serializers::JSON,
    env: Dotcrypt::Serializers::ENV
  }.freeze

  def self.for(format)
    SERIALIZERS.fetch(format.to_sym)
  rescue KeyError
    raise ArgumentError, "unknown format: '#{format}', supported formats: #{SERIALIZERS.keys}"
  end
end
