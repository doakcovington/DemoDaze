class User < ApplicationRecord
    has_many :demo_reports
    has_many :bikes, through: :demo_reports

    has_secure_password
end
