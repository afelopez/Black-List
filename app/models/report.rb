class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types

  validates_presence_of :reason, :summoner, :types
end
