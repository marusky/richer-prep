class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :transactions, dependent: :delete_all
end
