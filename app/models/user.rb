class User < ApplicationRecord
    before_save { self.username = username.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, message: 'Name is too short...' }
end