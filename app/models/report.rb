class CountPerDayValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)

    time = Time.now
    t = Report.new()
    count = record.class.where(attribute => value).count
      if count >= options[:max]
        if  time.min - t.lol.min < 1
            record.errors[attribute] << "cant be report more times"
        end
      end 
  end
end



class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email , :last 
  validates_presence_of  :summoner #,:reason, :types
  validates_length_of :summoner, :minimum => 4, :maximum => 20, :allow_blank => true
  validates :summoner, :count_per_day => {:max => 1}    
  def timestamp
    timestamp_field = DateTime.now
  end
end

