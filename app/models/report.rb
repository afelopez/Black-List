class CountPerDayValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value) 

    
    
      count = record.class.where(attribute => value).count
      omg = record.class.where(attribute => value)
        if count >= options[:max]
          ultimo = Time.now - 2400
          time = Time.now
          summ = omg.where(["created_at >= ? AND created_at <= ?", ultimo, time]).count  
          if summ >= 5
            record.errors[attribute] << "cant be report more times "
          end
        end
  end
end



class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email , :last 
  validates_presence_of  :reason, :types
  validates_length_of :summoner, :minimum => 4, :maximum => 20, :allow_blank => true
  validates :summoner, :count_per_day => {:max => 5}
    
end

