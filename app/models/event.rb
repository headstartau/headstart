class Event < ActiveRecord::Base
  attr_accessible :description, :venue, :ends_at, :name, :starts_at

  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end 

end
