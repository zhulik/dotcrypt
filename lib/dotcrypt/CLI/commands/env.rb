# frozen_string_literal: true

module Dotcrypt::Cli::Commands::ENV
  def self.included(thor)
    thor.class_eval do
      include Dotcrypt::Cli::Commands::Globals

      desc "env", "prints exports for ennv"

      def env = Dotcrypt::Cli::Commands::Show::Handler.new(**options.merge(output: :env)).call
    end
  end
end
