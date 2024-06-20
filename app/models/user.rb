class User < ApplicationRecord
  validates :given_name, :family_name, presence: true
  has_many :transactions
  has_many :categories

  devise :database_authenticatable, :registerable, :validatable

  def full_name
    "#{given_name} #{family_name}"
  end
end
