class Pet < ApplicationRecord
  belongs_to :owner, required: false
  has_many :walks
  has_many :users, through: :walks
  has_one_attached :image

  validates :name, presence: true

  scope :all_az, -> {all.order(:name)}

  def name_with_owner
    if owner
      "#{name} (#{owner.name})"
    else
      "#{name} (no owner assigned)"
    end
  end
end
