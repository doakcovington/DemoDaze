class Dealer < ApplicationRecord
    has_many :bikes

    validates :name, presence: true

    #scope methods:
    def self.alpha #sort by name
        order(name: :asc)
    end
end
