class User < ActiveRecord::Base
   validates :username, presence: true, length: { minimum: 2, maximum: 20 }
    validates :email, presence: true, length: { minimum: 2, maximum: 50 }
end