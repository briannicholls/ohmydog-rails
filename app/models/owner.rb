class Owner < ApplicationRecord
  has_many :pets
  has_many :walks, through: :pets

  def name
    "#{fname} #{lname}"
  end

end
