class Event < ActiveRecord::Base

  belongs_to :registered_application
  
  validates :registered_application_id, presence: true

end
