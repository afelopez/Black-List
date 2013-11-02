
RAILS_ROOT = File.dirname(__FILE__) + '/..'
require File.expand_path(File.dirname(__FILE__) + "/environment")

#
every 1.minutes do
  runner "CountPerDayValidator.validate_each"
  
end

