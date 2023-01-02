# frozen_string_literal: true

require "shellwords"

class Dotcrypt::Serializers::Env < Dotcrypt::Serializers::Serializer
  def call
    Dotcrypt::Flattener.call(@config).reduce("") do |result, (k, v)|
      result + (v.nil? ? "" : "export #{k}='#{escape(v)}'\n")
    end
  end

  private

  def escape(val) = val.gsub("'", %q('"'"'))
end