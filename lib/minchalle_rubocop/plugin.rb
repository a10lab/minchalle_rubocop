require 'lint_roller'

module MinchalleRubocop
  class Plugin < LintRoller::Plugin
    def about
      LintRoller::About.new(
        name: 'minchalle-rubocop',
        version: VERSION,
        homepage: 'https://github.com/a10lab/minchalle-rubocop',
        description: 'Shared rubocop configuration for Minchalle.'
      )
    end

    def supported?(context)
      context.engine == :rubocop
    end

    def rules(_context)
      LintRoller::Rules.new(
        type: :path,
        config_format: :rubocop,
        value: Pathname.new(__dir__).join('../../config/default.yml')
      )
    end
  end
end
