# frozen_string_literal: true

class Dotcrypt::Serializers::ENV < Dotcrypt::Serializers::Serializer
  def call
    # TODO: validate variable names
    Dotcrypt::Flattener.call(@config).reduce("") do |result, (k, v)|
      result + (v.nil? ? "" : "export #{k}='#{escape(v)}'\n")
    end
  end

  private

  def escape(val) = val.gsub("'", %q('"'"'))
end
