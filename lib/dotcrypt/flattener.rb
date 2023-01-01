# frozen_string_literal: true

class Dotcrypt::Flattener
  SCALARS = [String, Numeric, NilClass].freeze

  def self.call(...) = new(...).call

  def initialize(config, prefixes: [], accumulator: {}, separator: "_")
    @config = config
    @prefixes = prefixes
    @accumulator = accumulator
    @separator = separator
  end

  def call
    case config
    when *SCALARS then save(@config)
    when Hash then config.each { |k, v| self.class.call(v, prefixes: prefixes + [k], accumulator:, separator:) }
    when Array then flatten_array
    else raise TypeError, "unknown type: #{config.class}"
    end

    accumulator
  end

  private

  attr_reader :config, :prefixes, :accumulator, :separator

  def flatten_array
    raise TypeError, "only arrays of scalars are allowed, given: #{config}" unless config.all? { scalar?(_1) }

    save(config.to_json)
  end

  def scalar?(value) = SCALARS.any? { value.is_a?(_1) }

  def path = @prefixes.join(@separator)

  def save(value) = @accumulator[path] = value
end
