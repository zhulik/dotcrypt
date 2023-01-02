# frozen_string_literal: true

class Dotcrypt::Cli::App < Thor
  include Dotcrypt::Cli::Commands::Show
  include Dotcrypt::Cli::Commands::Exec
  include Dotcrypt::Cli::Commands::ENV
end
