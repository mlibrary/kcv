# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kcv/version"

Gem::Specification.new do |spec|
  spec.name = "kcv"
  spec.version = KCV::VERSION
  spec.authors = ["Noah Botimer"]
  spec.email = ["botimer@umich.edu"]

  spec.summary = "Glue gem for integration of Keycard, Checkpoint, and Vizier."
  spec.description = <<~DESC
    This gem provides utilities for using Keycard, Checkpoint, and Vizier together, which have
    no direct dependencies on each other. An application could implement any of these, but they
    provide a standard base implementation for convenience and consistency.
  DESC
  spec.homepage = "https://github.com/mlibrary/kcv"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "checkpoint", "~> 1.1.0"
  spec.add_dependency "keycard", "~> 0.3.0"
  spec.add_dependency "vizier", "~> 0.1.2"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "simplecov-lcov", "~> 0.8"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency "standard", "~> 1.7"
end
