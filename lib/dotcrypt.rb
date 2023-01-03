# frozen_string_literal: true

require "json"
require "yaml"

require "zeitwerk"
require "jsonnet"
require "thor"

loader = Zeitwerk::Loader.for_gem

loader.inflector.inflect(
  "env" => "ENV",
  "json" => "JSON",
  "yaml" => "YAML"
)

loader.setup

module Dotcrypt
  DEFAULT_NAME = ".env.jsonnet"

  class Error < StandardError
  end

  def self.setup(path: find_dotcrypt)
    Dotcrypt::Jsonnet.load_from(path).then do |c|
      Dotcrypt::Flattener.call(c).then do |f|
        ENV.merge!(f)
        return f
      end
    end
  end

  def self.find_dotcrypt
    dir = Dir.getwd
    loop do
      raise ".env.jsonnet is noot found" if dir == "/"

      path = File.join(dir, DEFAULT_NAME)

      return path if File.exist?(path)

      dir = File.expand_path("..", dir)
    end
  end
end
