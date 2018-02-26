class User < ApplicationRecord
    #use bcrypt to hash passwords when adding users
    has_secure_password
    has_many :studios
end
