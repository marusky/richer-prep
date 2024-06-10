class User < ApplicationRecord
  has_many :transactions
  devise :database_authenticatable, :registerable, :validatable
end
