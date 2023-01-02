# frozen_string_literal: true

require "shellwords"

class Dotcrypt::Serializers::Json < Dotcrypt::Serializers::Serializer
  def call = JSON.pretty_generate(@config)
end
