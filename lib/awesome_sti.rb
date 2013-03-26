#Awesome_sti alows you to simplify use of STI. It generates initializer with type casting,
#generates some variation on bang becomes! method and fixes the bug with needs_type_condition

require "awesome_sti/version"
require "awesome_sti/sti_awesome_enabled"

module AwesomeSti

end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, AwesomeSti::StiAwesomeEnabled
end
