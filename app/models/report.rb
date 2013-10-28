class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email

  validates_presence_of :reason, :summoner, :types
end
