class Application < ActiveRecord::Base

  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  
end
