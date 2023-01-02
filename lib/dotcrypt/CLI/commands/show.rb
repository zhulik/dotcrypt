# frozen_string_literal: true

module Dotcrypt::Cli::Commands::Show
  def self.included(thor) # rubocop:disable Metrics/MethodLength
    thor.class_eval do
      include Dotcrypt::Cli::Commands::Globals

      desc "show", "converts a dhall file into various formats"

      option :output, aliases: :o,
                      type: :string,
                      enum: Dotcrypt::Serializers::SERIALIZERS.keys.map(&:to_s),
                      default: "yaml",
                      desc: "Output format."

      option :flatten, aliases: :l,
                       type: :boolean,
                       default: false,
                       desc: "Whether to flatten the output. Always enabled for `env` format"

      def show = Handler.new(options).call
    end
  end

  class Handler
    def initialize(options)
      @options = options
    end

    def call = print(serializer.call(config))

    private

    def config
      @config ||= Dotcrypt::Dhall.load_from(@options[:file]).then do |c|
        next Dotcrypt::Flattener.call(c, separator: @options[:separator]) if @options[:flatten]

        c
      end
    end

    def serializer = Dotcrypt::Serializers.for(@options[:output])
  end
end
