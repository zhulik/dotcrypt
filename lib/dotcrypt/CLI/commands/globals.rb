# frozen_string_literal: true

module Dotcrypt::Cli::Commands::Globals
  def self.included(thor)
    thor.class_eval do
      option :separator, aliases: :s,
                         type: :string,
                         default: "_",
                         desc: "Separator for flattening"

      option :file, aliases: :f,
                    type: :string,
                    default: ".env.jsonnet",
                    desc: "Jsonnet file to read."
    end
  end
end
