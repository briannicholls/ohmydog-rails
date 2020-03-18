class Pet < ApplicationRecord
  belongs_to :owner, required: false
  has_many :walks
  has_many :users, through: :walks

  def name_with_owner
    "#{name} (#{owner.name})" if owner
  end
end
