class User < ApplicationRecord
  has_many :transactions
  has_many :categories

  devise :database_authenticatable, :registerable, :validatable
end
