class CountPerDayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    count = record.class.where(attribute => value).count
    record.errors[attribute] << "reportado muchas veces en esta hora" if count >= options[:max]
	tiempo = 10
	
    if count >= options[:max]
     #Scrip para el tiempo  	
    end
  
  end
end

class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email

  validates_presence_of :reason, :types

  validates :summoner, :presence => true,
                   :length => { :maximum => 20 }

 validates :summoner, :count_per_day => {:max => 4}


end
