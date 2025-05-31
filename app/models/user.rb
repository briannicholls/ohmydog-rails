class User < ApplicationRecord
  has_secure_password

  has_many :walks
  has_many :pets, through: :walks

  #include ActiveModel::Validations
  #validates_with FnameValidator
  #validates_with LnameValidator
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true


  def name
    "#{fname} #{lname}"
  end

  def admin?
    self.role == 'admin'
  end
end
