# frozen_string_literal: true

module Dotcrypt::Cli::Commands::Exec
  def self.included(thor)
    thor.class_eval do
      include Dotcrypt::Cli::Commands::Globals

      desc "exec COMMAND", "exec command a command with dhall env"

      def exec(*command) = Handler.new(command, **options).call
    end
  end

  class Handler
    def initialize(command, **options)
      @command = command
      @options = options
    end

    def call
      exec(env, *@command)
    end

    private

    def env
      @env ||= Dotcrypt::Dhall.load_from(@options[:file]).then do |c|
        # TODO: validate variable names
        Dotcrypt::Flattener.call(c, separator: @options[:separator])
      end
    end
  end
end
