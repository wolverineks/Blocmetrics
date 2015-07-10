class Event < ActiveRecord::Base

  belongs_to :application
  
  validates :application_id, presence: true

end
