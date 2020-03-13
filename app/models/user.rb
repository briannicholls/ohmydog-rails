class User < ApplicationRecord
  has_secure_password

  has_many :walks
  has_many :pets, through: :walks

  def name
    "#{fname} #{lname}"
  end
end
