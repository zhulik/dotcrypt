# frozen_string_literal: true

require_relative "lib/dotcrypt/version"

Gem::Specification.new do |spec|
  spec.name = "dotcrypt"
  spec.version = Dotcrypt::VERSION
  spec.authors = ["Gleb Sinyavskiy"]
  spec.email = ["zhulik.gleb@gmail.com"]

  spec.summary = "dotcrypt."
  spec.description = "dotcrypt."
  spec.homepage = "https://github.com/zhulik/dotrypt"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zhulik/dotrypt"
  spec.metadata["changelog_uri"] = "https://github.com/zhulik/dotrypt/releases"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "dhall", "~> 0.5.0"
  spec.add_dependency "thor", "~> 1.2.0"
  spec.add_dependency "zeitwerk", "~> 2.6.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
