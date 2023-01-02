# frozen_string_literal: true

class Dotcrypt::Serializers::YAML < Dotcrypt::Serializers::Serializer
  using Dotcrypt::CoreExt::Hash

  def call = ::YAML.dump(@config.deep_stringify_keys)
end
