class User < ApplicationRecord
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, message: 'Name is too short...' }
    mount_uploader :avatar, AvatarUploader
    validates_presence_of :avatar
end