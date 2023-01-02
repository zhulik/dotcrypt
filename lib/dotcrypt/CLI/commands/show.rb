# frozen_string_literal: true

module Dotcrypt::Cli::Commands::Show
  class Handler
    SERIALIZERS = {
      json: Dotcrypt::Serializers::Json,
      env: Dotcrypt::Serializers::Env
    }.freeze

    def initialize(file, **options)
      @file = file
      @options = options
    end

    def call = print(serializer.call(config))

    private

    def config
      @config ||= Dotcrypt::Dhall.load_from(@file).then do |c|
        next Dotcrypt::Flattener.call(c, separator: @options[:separator]) if @options[:flatten]

        c
      end
    end

    def serializer = SERIALIZERS[@options[:format].to_sym]
  end

  def self.included(thor) # rubocop:disable Metrics/MethodLength
    thor.class_eval do
      desc "show DHALL", "shows dhall file"

      option :format, aliases: :f,
                      type: :string,
                      enum: ["json", "env"],
                      default: "json",
                      desc: "Output format."

      option :flatten, aliases: :l,
                       type: :boolean,
                       default: false,
                       desc: "Whether to flatten the output. Always enabled for `env` format"

      option :separator, aliases: :s,
                         type: :string,
                         default: "_",
                         desc: "Separator for flattening"

      def show(file = "example.dhall") = Handler.new(file, **options).call
    end
  end
end
