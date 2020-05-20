class Bike < ApplicationRecord
  belongs_to :dealer
  has_many :demo_reports
  has_many :users, through: :demo_reports
end
