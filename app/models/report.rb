class CountPerDayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    last = Time.now
    time = Time.now
    if time.min - last.min < 1 
    count = record.class.where(attribute => value).count
    record.errors[attribute] << "reportado muchas veces en esta hora" if count >= options[:max]
    end
  end
end



class Report < ActiveRecord::Base
  attr_accessible :detail, :reason, :summoner, :types , :email , :last

  validates_presence_of :reason, :types, :summoner

  validates :summoner, :presence => true,
                   :length => { :maximum => 20 }
  validates :summoner, :count_per_day => {:max => 4}

  after_create :metodo
  def metodo
    last = Time.now
  end
end
