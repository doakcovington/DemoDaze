class User < ApplicationRecord
    has_many :demo_reports
    has_many :bikes, through: :demo_reports
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true

    has_secure_password

    def self.omniauth_user(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |user|#looks through db to see if email already exists (if not then initialize user)
            user.name = auth[:info][:name]
            user.password = SecureRandom.hex #creates random password
        end
    end
end
