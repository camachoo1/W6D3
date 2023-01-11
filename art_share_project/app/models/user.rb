class User < ApplicationRecord
  validate :username, presence: true, uniqueness: true
end