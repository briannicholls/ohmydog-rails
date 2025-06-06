class Owner < ApplicationRecord
  belongs_to :user, optional: true
  has_many :pets, dependent: :nullify
  has_many :walks, through: :pets
  has_one_attached :entry_instructions_photo

  validates :fname, presence: true
  # validates :lname, presence: true
  validates :phone, presence: true

  accepts_nested_attributes_for :pets

  before_save :update_neighborhood

  def name
    "#{fname} #{lname}"
  end

  private

  def update_neighborhood
    if neighborhood.blank? && will_save_change_to_zip_code?
      self.neighborhood = NycNeighborhoods.neighborhood(zip_code)
    end
  end
end
