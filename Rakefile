# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

namespace :dhall do
  dhall_files = Dir["./**/.*.dhall"] + Dir["./**/*.dhall"]

  def dhall(*args)
    system("dhall", *args, exception: true)
  end

  task :check_fmt do
    dhall("format", "--check", *dhall_files)
  end

  task :fmt do
    dhall("format", *dhall_files)
  end
end

task default: ["dhall:fmt", :spec, :rubocop]
