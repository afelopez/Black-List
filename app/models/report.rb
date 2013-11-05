class CountPerDayValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value) 

    
    
      count = record.class.where(attribute => value).count
        if count >= options[:max]
          ultimo = Time.now - 60
          time = Time.now
          summ = Report.where(["created_at >= ? AND created_at <= ?", ultimo, time]).count  
          if summ >= 4
            record.errors[attribute] << "cant be report more times"
          end
        end
  end
end



class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email , :last 
 # validates_presence_of  :reason, :types
  validates_length_of :summoner, :minimum => 4, :maximum => 20, :allow_blank => true
  validates :summoner, :count_per_day => {:max => 4}
    
end

