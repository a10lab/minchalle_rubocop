require_relative "minchalle_rubocop/version"
require_relative "minchalle_rubocop/plugin"

Dir[File.join(__dir__, "minchalle_rubocop", "cop", "*.rb")].each do |file|
  require file
end
