# frozen_string_literal: true

module Dotcrypt::Cli::Commands::Load
  def self.included(thor)
    thor.class_eval do
      desc "load DHALL", "loads dhall file"
      # option :name, type: :string, default: ENV.fetch("NAME", nil)
      def load(file = "example.dhall")
        config = Dotcrypt::Dhall.load(File.read(file))

        print(Dotcrypt::Serializers::Env.call(config))
      end
    end
  end
end
