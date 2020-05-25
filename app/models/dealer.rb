class Dealer < ApplicationRecord
    has_many :bikes

    validates :name, presence: true
end
