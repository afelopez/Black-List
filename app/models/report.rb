class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :type
end
