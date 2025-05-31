class Owner < ApplicationRecord
  has_many :pets, dependent: :nullify
  has_many :walks, through: :pets

  #include ActiveModel::Validations
  #validates_with FnameValidator
  #validates_with LnameValidator

  validates :fname, presence: true
  validates :lname, presence: true
  validates :phone, presence: true

  accepts_nested_attributes_for :pets

  before_save :update_neighborhood

  def name
    "#{fname} #{lname}"
  end

  def update_neighborhood
    self.neighborhood = NycNeighborhoods.neighborhood(zip_code).name
  end

end
