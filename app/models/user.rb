class User < ApplicationRecord
  has_many :accounts, dependent: :restrict_with_exception

  has_secure_password
end
