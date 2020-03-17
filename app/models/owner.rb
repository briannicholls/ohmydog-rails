class Owner < ApplicationRecord
  has_many :pets, dependent: :nullify
  has_many :walks, through: :pets

  def name
    "#{fname} #{lname}"
  end

end
