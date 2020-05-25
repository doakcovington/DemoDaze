class Bike < ApplicationRecord
  belongs_to :dealer
  has_many :demo_reports
  has_many :users, through: :demo_reports
  accepts_nested_attributes_for :dealer

  validates :name, presence: true

  def dealer_attributes=(attributes)
    dealer = Dealer.find_or_create_by(attributes) if !attributes['name'].empty?
  end
end
