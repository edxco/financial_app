class User < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, message: 'Name is too short...' }
end