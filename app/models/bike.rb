class Bike < ApplicationRecord
  belongs_to :dealer
  has_many :demo_reports
  has_many :users, through: :demo_reports
  accepts_nested_attributes_for :dealer

  validates :name, presence: true
  validate :dealer_bike_uniquness

  scope :order_by_number_of_demo_reports,-> {left_joins(:demo_reports).group(:id).order('count(*)desc')} #Order the bikes by number of demo reports from most demo reports to least

  def dealer_attributes=(attributes) #reader method for dealer nested form inside new bike form
    self.dealer = Dealer.find_or_create_by(attributes) if !attributes['name'].empty?
    self.dealer
  end

  def dealer_bike_uniquness
    #if a bike with that name already belongs to a dealer, don't create a new bike object
    if Bike.find_by(name: name, dealer_id: dealer_id) 
      errors.add(:name, "This bike already exists for this dealer. You can write a demo report for this bike on the bike page!")
    end
  end
end
