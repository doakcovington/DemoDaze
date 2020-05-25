class DemoReport < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :report, presence: true 
end
