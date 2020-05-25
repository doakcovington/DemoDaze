class DealersController < ApplicationController
    def index
        @dealers = Dealer.alpha #sorts delears in alphabetical order
    end
end
