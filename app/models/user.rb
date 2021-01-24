class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4,
                                                                                        message: 'Name is too short' }
  validates_presence_of :avatar

  has_one_attached :avatar

  has_many :groups
  has_many :transactions
end
