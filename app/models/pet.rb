class Pet < ApplicationRecord
  belongs_to :owner, required: false
  has_many :walks
  has_many :users, through: :walks
end
