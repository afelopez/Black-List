class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types
  attr_accessor :title
	validates_presence_of :reason, :summoner, :types
end
