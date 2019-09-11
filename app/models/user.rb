class User < ApplicationRecord
    has_secure_password
    has_one :chip
    has_many :games 
end
