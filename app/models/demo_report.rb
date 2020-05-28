class DemoReport < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  #add scope method for bike_id
  #add scope to sort by user_id
  
  

  validates :report, presence: true
  validates :report, length: { minimum: 25}
end
