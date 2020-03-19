class Pet < ApplicationRecord
  belongs_to :owner, required: false
  has_many :walks
  has_many :users, through: :walks

  validates :name, presence: true

  scope :all_az, -> {all.order(:name)}

  def name_with_owner
    "#{name} (#{owner.name})" if owner
  end
end
