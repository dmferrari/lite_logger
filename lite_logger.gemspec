# frozen_string_literal: true

require_relative 'lib/lite_logger/version'

Gem::Specification.new do |spec|
  spec.name = 'lite_logger'
  spec.version = LiteLogger::VERSION
  spec.authors = ['Martin Ferrari']
  spec.email = ['dmferrari@gmail.com']

  spec.description = 'LiteLogger provides customizable log levels, formats, and destinations.'
  spec.homepage = 'https://github.com/dmferrari/lite_logger'
  spec.license = 'MIT'
  spec.summary = 'A lightweight logging solution for Ruby on Rails applications.'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dmferrari/lite_logger'
  spec.metadata['changelog_uri'] = 'https://github.com/dmferrari/lite_logger/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rake', '~> 13.0'
  spec.add_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rubocop', '~> 1.21'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
