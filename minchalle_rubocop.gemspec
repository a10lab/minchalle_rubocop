# frozen_string_literal: true

require_relative 'lib/minchalle_rubocop/version'

Gem::Specification.new do |spec|
  spec.name          = 'minchalle_rubocop'
  spec.version       = MinchalleRubocop::VERSION
  spec.authors       = ['yasuhiroki']
  spec.email         = ['yasuhiro.kiyota@a10lab.com']

  spec.summary       = 'Shared RuboCop configuration and custom cops for Minchalle projects.'
  spec.homepage      = 'https://github.com/a10lab/minchalle_rubocop'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['default_lint_roller_plugin'] = 'MinchalleRubocop::Plugin'

  spec.files = Dir.chdir(__dir__) do
    Dir.glob("{lib,config}/**/*") + ["README.md", "minchalle_rubocop.gemspec"].select { |f| File.exist?(f) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '1.87.0'
  spec.add_dependency 'rubocop-rails', '2.35.3'
  spec.add_dependency 'lint_roller'
end
