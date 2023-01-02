# frozen_string_literal: true

module Dotcrypt::CoreExt::Hash
  refine Hash do
    def deep_stringify_keys
      to_h { |k, v| [k.to_s, v.is_a?(Hash) ? v.deep_stringify_keys : v] }
    end

    def deep_symbolize_keys
      to_h { |k, v| [k.to_sym, v.is_a?(Hash) ? v.deep_symbolize_keys : v] }
    end
  end
end
