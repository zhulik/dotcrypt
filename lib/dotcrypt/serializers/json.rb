# frozen_string_literal: true

class Dotcrypt::Serializers::JSON < Dotcrypt::Serializers::Serializer
  def call = JSON.pretty_generate(@config)
end
