class Bike < ApplicationRecord
  belongs_to :dealer
  has_many :demo_reports
  has_many :users, through: :demo_reports
  accepts_nested_attributes_for :dealer

  validates :name, presence: true
  validates :dealer, presence: true
end
